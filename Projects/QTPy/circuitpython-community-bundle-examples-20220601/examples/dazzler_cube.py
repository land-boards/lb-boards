# Port of the 'cube' Gameduino demo/example code from the Arduino environment, for the Dazzler Gameduino in CircuitPython
# Harvey.Vrsalovic , May 2021
#
#  This is more or less a "straight, naive" port from the C lang. and the Arduino libraries + Gameduino library into Python
#   It is intended to be a starting point for other code, and thus care was not taken for it to be optimized nor 100% exact to the
#   original code.
#  Also certain things were added that were not in the original C code,
#   like the Wii controller interface used on the Dazzler.
#
#

import bteve as eve
import math
import time

framenum = 0

P = 125
N = -P

CUBE_vertices = [
    P,P,P,
    N,P,P,
    P,N,P,
    N,N,P,

    P,P,N,
    N,P,N,
    P,N,N,
    N,N,N
]

def N_VERTICES():
    return int(len(CUBE_vertices) / 3)

# each line is a face: count, normal, 4 vertices
CUBE_faces = [
    4, 0,0,127,   0, 1, 3, 2,         #0
    4, 0,0,-127,  6, 7, 5, 4,         #8

    4, 0,127,0,   4, 5, 1, 0,         #16
    4, 0,-127,0,  2, 3, 7, 6,         #24

    4, 127,0,0,   0, 2, 6, 4,         #32
    4, -127,0,0,  3, 1, 5, 7,         #40

    -1                                #48
]

# 3D Projection

model_mat = [
    1.0, 0.0, 0.0,
    0.0, 1.0, 0.0,
    0.0, 0.0, 1.0
]

normal_mat = [
    1.0, 0.0, 0.0,
    0.0, 1.0, 0.0,
    0.0, 0.0, 1.0
]

def mult_matrices(a, b, c):
    result = [0] * 9
    for i in range(0,3):
        for j in range(0,3):
            idx = 3*i+j
            result[idx] = 0.0
            for k in range(0,3):
                result[idx] += a[3*i+k] * b[3*k+j]
    return result

def rotate(m, mi, angle, axis):
# (Based on glRotate())
# angle is a list of 3 elements, representing the vector <x,y,z> that's the axis of rotation
#   BE SURE THAT IT IS NORMALIZED (magnitude == 1)
# returns tuple of m, mi
#   3x3 rotation matrix in 'm'
#   and its inverse in 'mi'

    x = axis[0]
    y = axis[1]
    z = axis[2]

    s = math.sin(angle)
    c = math.cos(angle)

    xx = x*x*(1-c)
    xy = x*y*(1-c)
    xz = x*z*(1-c)
    yy = y*y*(1-c)
    yz = y*z*(1-c)
    zz = z*z*(1-c)

    xs = x * s
    ys = y * s
    zs = z * s

    m[0] = xx + c
    m[1] = xy - zs
    m[2] = xz + ys

    m[3] = xy + zs
    m[4] = yy + c
    m[5] = yz - xs

    m[6] = xz - ys
    m[7] = yz + xs
    m[8] = zz + c

    mi[0] = m[0]
    mi[1] = xy + zs
    mi[2] = xz - ys

    mi[3] = xy - zs
    mi[4] = m[4]
    mi[5] = yz + xs

    mi[6] = xz + ys
    mi[7] = yz - xs
    mi[8] = m[8]

    return m, mi

def rotation(angle, axis):
    global model_mat
    global normal_mat

    mat = [0] * 9
    mati = [0] * 9

    mat, mati = rotate(mat, mati, angle, axis)
    model_mat = mult_matrices(model_mat, mat, model_mat)
    normal_mat = mult_matrices(mati, normal_mat, normal_mat)

projected = [(0,0)] * N_VERTICES()

def project(gd):

    global CUBE_vertices
    global framenum

    pm = 0
    pm_e = len(CUBE_vertices)
    dst = 0

    scale = 30
    while pm < pm_e:
        x = int((scale * CUBE_vertices[pm]))
        pm += 1
        y = int((scale * CUBE_vertices[pm]))
        pm += 1
        z = int((scale * CUBE_vertices[pm]))
        pm += 1
        xx = x * model_mat[0] + y * model_mat[3] + z * model_mat[6]
        yy = x * model_mat[1] + y * model_mat[4] + z * model_mat[7]
        projected[dst] = ( (((gd.w / 2 + xx))) ,  (((gd.h / 2 + yy))) )
        dst += 1

def transform_normal(nx, ny, nz):
    global normal_mat
    xx = nx * normal_mat[0] + ny * normal_mat[1] + nz * normal_mat[2]
    yy = nx * normal_mat[3] + ny * normal_mat[4] + nz * normal_mat[5]
    zz = nx * normal_mat[6] + ny * normal_mat[7] + nz * normal_mat[8]
    return xx, yy, zz

def draw_quad(gd, x1, y1, x2, y2, x3, y3, bx1, by1, bx3, by3):

    # Compute the fourth vertex of the parallelogram, (x4,y4)
    x4 = x3 + (x1 - x2)
    y4 = y3 + (y1 - y2)

    # Apply Scissor to the extents of the quad
    minx = max(0,    min(min(x1, x2), min(x3, x4)))
    maxx = min(gd.w, max(max(x1, x2), max(x3, x4)))
    miny = max(0,    min(min(y1, y2), min(y3, y4)))
    maxy = min(gd.h, max(max(y1, y2), max(y3, y4)))
    gd.ScissorXY(minx, miny)
    gd.ScissorSize(maxx - minx, maxy - miny)

    gd.cmd_bitmap_transform(
        (x1 - minx),
        (y1 - miny),
        (x2 - minx),
        (y2 - miny),
        (x3 - minx),
        (y3 - miny),
        (bx1),
        (by1),
        (bx1),
        (by3),
        (bx3),
        (by3),
        0)  # result slot, ignored


# Draw the quad
    # ORIGINAL line from the C code version:
#   gd.Vertex2f(minx << 4, miny << 4)
# again, the Dazzler seems to not work with subpixels, so no *16 multiplys
    gd.Vertex2f(minx, miny)

def draw_faces(gd, dir, offset_x, offset_y):

    global CUBE_faces
    R = 5
    p = 0

    gd.BlendFunc(eve.ONE, eve.ONE_MINUS_SRC_ALPHA)
    gd.Begin(eve.BITMAPS)

    facen = 0
    n = CUBE_faces[p]
    while n != -1:
        facen += 1
        p += 1
        nx = CUBE_faces[p]
        p += 1
        ny = CUBE_faces[p]
        p += 1
        nz = CUBE_faces[p]
        p += 1

        v1 = CUBE_faces[p]
        v2 = CUBE_faces[p + 1]
        v3 = CUBE_faces[p + 2]
        p += n
        n = CUBE_faces[p]

        x1 = projected[v1][0]
        y1 = projected[v1][1]
        x2 = projected[v2][0]
        y2 = projected[v2][1]
        x3 = projected[v3][0]
        y3 = projected[v3][1]
        area = (x1 - x3) * (y2 - y1) - (x1 - x2) * (y3 - y1)
        face = 1 if area < 0 else 0
        if face == dir:
            r = 20
            g = 20
            b = 80   # Ambient

            if face == 1:
                nx,ny,nz = transform_normal(nx, ny, nz)
                d = max(0, -nz)                      # diffuse light from +ve Z

                r += 2 * d
                g += 2 * d
                b += 2 * d

            gd.ColorRGB(min(255, int(r)), min(255, int(g)), min(255, int(b)))

            x1 = int(x1 /16)  + offset_x
            y1 = int(y1 /16)    +offset_y
            x2 = int(x2 /16)    +offset_x
            y2 = int(y2 /16)    +offset_y
            x3 = int(x3 /16)    +offset_x
            y3 = int(y3 /16)    +offset_y

            draw_quad(gd, x1, y1, x2, y2, x3, y3, -R, -R, 128 + R, 128 + R)


# this function is needed because rotate() function requires a normalized vector for
#   the axis of rotation in x,y,z
def normalize(vector):
    mag = 0
    for e in vector:
        mag += e*e
    if mag == 0:
        return vector, 0

    mag = math.sqrt(mag)
    for i in range(0,len(vector)):
        vector[i] = vector[i] / mag
    return vector, mag

def cube_main(gd):

    global framenum

    gd.cmd_loadimage(0, 0)
    gd.load(open("/sd/healsky3.jpg", "rb"))
    print("width = {0}, height = {1}".format(gd.w, gd.h))
    gd.BitmapHandle(0)
    gd.BitmapSize(eve.NEAREST, eve.BORDER, eve.BORDER, 0, 0)

    g1=gd.controllers()[0]          # Note: this is a ONE TIME variable "snapshot" of all the sticks and buttons
    cx=gd.w//2
    cy=gd.h//2
    rx = 0
    ry = 0
    rz = 0

    while not g1.buttons.home:
        framenum += 1
        if g1.buttons.start:
            cx = gd.w // 2
            cy = gd.h // 2
        cx = cx + (g1.joysticks.lx - 32) // 4
        cy = cy - (g1.joysticks.ly - 32) // 4

        rrx = g1.joysticks.rx - 16
        rry = g1.joysticks.ry - 16

        rx = 1 if rrx != 0 else 0
        ry = 1 if rry != 0 else 0
        rz = 1 if rrx !=0 and rry != 0 else 0

        rot_angle = 0.1
        if rrx < 0 or rry < 0:
            rot_angle = -0.1

        gd.ClearColorRGB(5, 0, 0)
        gd.Clear()
        norm_rot, magnitude = normalize([rx, ry, rz])
        if magnitude != 0:
            rotation(rot_angle, norm_rot)

        project(gd)
        draw_faces(gd, 0, cx, cy)
        draw_faces(gd, 1, cx, cy)
        gd.swap()

        # refresh the controller state (sticks and buttons' values)
        g1 = gd.controllers()[0]

    print("exited")

if __name__ == "__main__":
    gd = eve.Gameduino()
    gd.init()
    cube_main(gd)

