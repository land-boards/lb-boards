# Scalar netork analyser by R Heslip
# based on:
# SpectrumAnalyzer-v01a.py(w)  (09-12-2011)
# For Python version 2.6 or 2.7
# With external module pyaudio (for Python version 2.6 or 2.7); NUMPY module (for used Python version)
# Created by Onno Hoekstra (pa2ohh)
import pyaudio
import math
import time
import serial
import numpy
import tkFont
from time import sleep
from Tkinter import *
from tkFileDialog import askopenfilename
from tkSimpleDialog import askstring
from tkMessageBox import *

# change this to the appropriate serial port for your setup
SERIALPORT = "COM4"

# Values that can be modified
#GRWN = 800                  # Width of the grid
#GRHN = 400                  # Height of the grid
GRWN = 1024                  # Width of the grid
GRHN =  512                  # Height of the grid
X0L = 20                    # Left top X value of grid
Y0T = 25                    # Left top Y value of grid

Vdiv = 8                    # Number of vertical divisions

TRACEmode = 1               # 1 normal mode, 2 max hold, 3 average
TRACEaverage = 5           # Number of samples to average for average mode
TRACEreset = True           # True for first new trace, reset max hold and averageing
Sweepreset = False       # flag to restart the sample sweep

UPDATEspeed = 1.1           # Update speed can be increased when problems if PC too slow, default 1.1
                            
DBdivlist = [1, 2, 3, 5, 10, 20] # dB per division
DBdivindex = 4              # 10 dB/div as initial value

DBlevel = 10                 # Reference level

MAXSAMPLES=1000
Samplelist = [50, 100, 200,500,1000] # samples per sweep
Sampleindex = 0              # initial value
SAMPLES = Samplelist[Sampleindex]          # samples per sweep

# Colors that can be modified
COLORframes = "#000080"     # Color = "#rrggbb" rr=red gg=green bb=blue, Hexadecimal values 00 - ff
COLORcanvas = "#000000"
COLORgrid = "#808080"
COLORtrace1 = "#00ff00"
COLORtrace2 = "#ff8000"
COLORtext = "#ffffff"
COLORsignalband = "#ff0000"
COLORaudiobar = "#606060"
COLORaudiook = "#00ff00"
COLORred = "#ff0000"
COLORMarker1 = "#ff0000"
COLORMarker2 = "#ffff00"

# Button sizes that can be modified
Buttonwidth1 = 12
Buttonwidth2 = 8


# Initialisation of general variables

STARTfrequency = 10000000.0        # Startfrequency
STOPfrequency = 15000000.0     # Stopfrequency

                            
# Other global variables required in various routines
GRW = GRWN                  # Initialize GRW
GRH = GRHN                  # Initialize GRH

CANVASwidth = GRW + 2 * X0L # The canvas width
CANVASheight = GRH + 80     # The canvas height

DBmreadings = [0 for x in range(MAXSAMPLES)]           # samples
REFreadings = [0 for x in range(MAXSAMPLES)]            # reference samples

T1line = []                 # Trace line channel 1
T2line = []                 # Trace line channel 2

S1line = []                 # Line for start of signal band indication
S2line = []                 # line for stop of signal band indication

RUNstatus = 1               # 0 stopped, 1 start, 2 running, 3 stop now, 4 stop and restart
STOREtrace = False          # Store and display trace
Referenceon  = 0            # apply calbration reference
REFstore  = 0               # save calbration readings

Marker1x = 0                # marker pip 1 location
Marker1y = 0

Marker2x = 0                # marker pip 2
Marker2y = 0

def Zerosamples(): # reset the sample array - minimizes confusion when setting are changed
    global DBmreadings
    DBmreadings = [0 for x in range(MAXSAMPLES)]
    
# =================================== Start widgets routines ========================================
def on_click(self, event):
        # Last click in absolute coordinates
        self.prev_var.set('%s:%s' % self.last_point)
        # Current point in relative coordinates
        self.curr_var.set('%s:%s' % (event.x - self.last_point[0], event.y - self.last_point[1]))
        self.last_point = event.x, event.y

def Bnot():
    print "Routine not made yet"

# handle markers when mouse is clicked in middle frame
def Bmarker1(event):
    global Marker1x
    global Marker1y
    
    Marker1x=event.x
    Marker1y=event.y

def Bmarker2(event):
    global Marker2x
    global Marker2y
    
    Marker2x=event.x
    Marker2y=event.y
    #print "button 2 clicked at", event.x, event.y
    

def BAveragemode():
    global TRACEmode
    global TRACEaverage
    global TRACEreset

    TRACEreset = True       # Reset trace peak and trace average
    TRACEmode = 3

    s = askstring("Power averaging", "Value: " + str(TRACEaverage) + "x\n\nNew value:\n(1-n)")

    if (s == None):         # If Cancel pressed, then None
        return()

    try:                    # Error if for example no numeric characters or OK pressed without input (s = "")
        v = int(s)
    except:
        s = "error"

    if s != "error":
        TRACEaverage = v

    if TRACEaverage < 1:
        TRACEaverage = 1
        
    if TRACEaverage > 30:
        TRACEaverage = 30  # avoid very long sweep times
        
    UpdateScreen()          # Always Update


def Calibrateref():
    global REFstore
    global RUNstatus
    global Sweepreset
    
    if REFstore == 0:
        REFstore = 1
        Sweepreset= True    # force a new sweep
    else:
        REFstore = 0

    UpdateAll()          # Always Update


def Calonoff():
    global Referenceon
    global RUNstatus
    
    if Referenceon == 0:
        Referenceon = 1
    else:
        Referenceon = 0
    if RUNstatus == 0:      # Update if stopped
        UpdateScreen()


def BSTOREtrace():
    global STOREtrace
    global T1line
    global T2line
    if STOREtrace == False:
        T2line = T1line
        STOREtrace = True
    else:
        STOREtrace = False
    UpdateTrace()           # Always Update

def BAutoY():  # auto adjust offset and range 
    global Vdiv
    global DBlevel
    global DBdivlist
    global DBdivindex
    global DBmreadings           # samples
    global REFreadings           # reference samples
    global Referenceon
    global SAMPLES

    readings=numpy.array(DBmreadings[0:SAMPLES]) 
    ref = numpy.array(REFreadings[0:SAMPLES]) 
    if Referenceon:
        readings=readings-ref 
        
    maxDB=max(readings)
    minDB=min(readings)
    DBlevel=int (maxDB)   # round down to nearest int 
    DBperdivision=(maxDB-minDB)*1.2/Vdiv # make the range a little bit bigger
#tricky way to find closest value in a list
    DBdivindex= min(range(len(DBdivlist)), key=lambda i: abs(DBdivlist[i]-DBperdivision))

    print DBdivindex
    UpdateTrace()           # Always Update


def BSNmode():
    global RUNstatus

    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def BSNfreq1():
    global RUNstatus
    global CENTERsignalfreq
    global SNfreqstep
    global SNmeasurement

    CENTERsignalfreq = CENTERsignalfreq - SNfreqstep
    if CENTERsignalfreq < 0:
        CENTERsignalfreq = 0

    if RUNstatus == 0:              # Update if stopped
        UpdateTrace()


def BStart():
    global RUNstatus
    
    if (RUNstatus == 0):
        RUNstatus = 1
    UpdateScreen()          # Always Update


def Blevel1():
    global RUNstatus
    global DBlevel

    DBlevel = DBlevel - 1
    
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def Blevel2():
    global RUNstatus
    global DBlevel

    DBlevel = DBlevel + 1
    
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def Blevel3():
    global RUNstatus
    global DBlevel

    DBlevel = DBlevel - 10
    
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def Blevel4():
    global RUNstatus
    global DBlevel

    DBlevel = DBlevel + 10
    
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def BStop():
    global RUNstatus
    global Sweepreset
    
    if (RUNstatus == 1):
        RUNstatus = 0
    elif (RUNstatus == 2):
        RUNstatus = 3
    elif (RUNstatus == 3):
        RUNstatus = 3
    elif (RUNstatus == 4):
        RUNstatus = 3
    Sweepreset=True         # stop the sweep
    UpdateScreen()          # Always Update



def BStartfrequency():
    global STARTfrequency
    global STOPfrequency
    global Referenceon
    global RUNstatus
    global Sweepreset
    
    # if (RUNstatus != 0):
    #    showwarning("WARNING","Stop sweep first")
    #    return()
    
    s = askstring("Startfrequency: ","Value: " + str(STARTfrequency/1000000) + " MHz\n\nNew value:\n")
    
    if (s == None):         # If Cancel pressed, then None
        return()

    try:                    # Error if for example no numeric characters or OK pressed without input (s = "")
        v = float(s)
    except:
        s = "error"

    if s != "error":
        STARTfrequency = abs(v)*1000000

    if STOPfrequency <= STARTfrequency:
        STOPfrequency = STARTfrequency + 1

    Referenceon = 0      # ref level not valid
    Zerosamples()               # reset sample values
    Sweepreset = True       # Reset trace peak and trace average
    
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def BStopfrequency():
    global STARTfrequency
    global STOPfrequency
    global Referenceon
    global RUNstatus
    global Sweepreset
    
    # if (RUNstatus != 0):
    #    showwarning("WARNING","Stop sweep first")
    #    return()

    s = askstring("Stopfrequency: ","Value: " + str(STOPfrequency/1000000) + " MHz\n\nNew value:\n")

    if (s == None):         # If Cancel pressed, then None
        return()

    try:                    # Error if for example no numeric characters or OK pressed without input (s = "")
        v = float(s)
    except:
        s = "error"

    if s != "error":
        STOPfrequency = abs(v)*1000000

    if STOPfrequency < 10:  # Minimum stopfrequency 10 Hz
        STOPfrequency = 10
        
    if STARTfrequency >= STOPfrequency:
        STARTfrequency = STOPfrequency - 1
        
    Referenceon = 0      # ref level not valid
    Zerosamples()  # reset sample values
    Sweepreset = True       # Reset trace peak and trace average
    
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


        
# samples per sweep can also be set via the setup dialog for custom values
def Bsamples1():
    global SAMPLES
    global Samplelist
    global Sampleindex
    global Referenceon
    global RUNstatus
    global Sweepreset
    
    if (Sampleindex >= 1):
        Sampleindex = Sampleindex - 1
        SAMPLES=Samplelist[Sampleindex]
        
    Referenceon=0            # reference array is no longer valid
    Zerosamples()               # reset sample values
    Sweepreset = True   # restart sweep
        
    if RUNstatus == 0:      # Update if stopped
        UpdateScreen()
    if RUNstatus == 2:      # Restart if running
        RUNstatus = 4


def Bsamples2():
    global SAMPLES
    global Referenceon
    global Samplelist
    global Sampleindex
    global RUNstatus
    global Sweepreset
      
    if (Sampleindex < len(Samplelist) - 1):
        Sampleindex = Sampleindex + 1
        SAMPLES=Samplelist[Sampleindex]
        
    Referenceon=0            # reference array is no longer valid
    Zerosamples()               # reset sample values
    Sweepreset = True   # restart sweep
    if RUNstatus == 0:      # Update if stopped
        UpdateScreen()
    if RUNstatus == 2:      # Restart if running
        RUNstatus = 4


def BDBdiv1():
    global DBdivindex
    global RUNstatus
    
    if (DBdivindex >= 1):
        DBdivindex = DBdivindex - 1
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()


def BDBdiv2():
    global DBdivindex
    global DBdivlist
    global RUNstatus
    
    if (DBdivindex < len(DBdivlist) - 1):
        DBdivindex = DBdivindex + 1
    if RUNstatus == 0:      # Update if stopped
        UpdateTrace()




# ============================================ Main routine ====================================================
    
def Sweep():   # Read samples
    global SERIALPORT
    global DBmreadings
    global REFstore
    global REFreadings
    global STARTfrequency
    global STOPfrequency
    global RUNstatus
    global Sweepstatus
    global SMPfftlist
    global SMPfftindex
    global SAMPLES
    global UPDATEspeed
    global RXbuffer
    global RXbufferoverflow
    global TRACEmode
    global TRACEaverage
    global Sweepreset


    while (True):                                           # Main loop
        # RUNstatus = 1 : Open Stream
        if (RUNstatus == 1):
            if UPDATEspeed < 1:
                UPDATEspeed = 1.0

            TRACESopened = 1
            try:
                ser = serial.Serial(SERIALPORT, 9600, timeout=1)
                RUNstatus = 2
            except:                                         # If error in opening audio stream, show error
                RUNstatus = 0
                showerror("Cannot open Serial device")
            
            UpdateScreen()                                  # UpdateScreen() call    

        # RUNstatus = 2: Reading data from power monitor
        if (RUNstatus == 2):

            adsamplecount=1
            if (TRACEmode == 3):      # average mode
                adsamplecount=TRACEaverage
                
#create the list of frequencies - X axis
            incr=(STOPfrequency-STARTfrequency)/SAMPLES
            t = numpy.arange(STARTfrequency, STOPfrequency, incr)

            #if REFstore == 1:  # save ref levels
                #REFreadings=[]
            j=0
            step=0
            # DBmreadings =[] # y axis measurements
            #for frequency in t:
            frequency=STARTfrequency
            while ((step < SAMPLES) & (Sweepreset==False)):
                cmd = str(long(frequency))
                cmd = cmd + "\n"
                #print cmd
                ser.write(cmd) # set DDS frequency
                dbm = 0
                i=0
                UpdateTrace() # update the screen to keep UI responsive also serves as a delay
                #sleep(0.02)  # time delay to let the power meter settle 
                while (i < adsamplecount) : # read power a few times and average results
                    ser.write("\n")    # request power reading
                    line = ser.readline()
                    line = line.strip()
                    if len(line) !=0:
                        #print line
                        dbm = dbm + float(line)
                    
                    i=i+1

                dbm = dbm/adsamplecount
                #print dbm
                DBmreadings[step]= dbm # save new power reading to y measurements

                if REFstore == True:  # save ref levels
                    REFreadings[step]= dbm # save ref level

                frequency=frequency+incr                    
                step=step+1
                
            cmd = str(long(STARTfrequency)) # prime the dds with the initial measurement for the next cycle
            cmd = cmd + "\n"
            ser.write(cmd) # set DDS back to start frequency
            sleep(0.1)  # time delay to let the power meter settle 
            UpdateAll()                                     # Update Data, trace and screen
            Sweepreset=False  # reset the sweep "start over" flag
            if ((REFstore == True) & (step == SAMPLES)): # make sure we have 1 full sweep to cal
                REFstore=False   #reset the store reference flag
            
        # RUNstatus = 3: Stop
        # RUNstatus = 4: Stop and restart
        if (RUNstatus == 3) or (RUNstatus == 4):
            ser.close()
            if RUNstatus == 3:
                RUNstatus = 0                               # Status is stopped 
            if RUNstatus == 4:          
                RUNstatus = 1                               # Status is (re)start
            UpdateScreen()                                  # UpdateScreen() call


        # Update tasks and screens by TKinter 
        root.update_idletasks()
        root.update()                                       # update screens


def UpdateAll():        # Update Data, trace and screen
    MakeTrace()         # Update the traces
    UpdateScreen()      # Update the screen 


def UpdateTrace():      # Update trace and screen
    MakeTrace()         # Update traces
    UpdateScreen()      # Update the screen


def UpdateScreen():     # Update screen with trace and text
    MakeScreen()        # Update the screen
    root.update()       # Activate updated screens    



def MakeTrace():        # Update the grid and trace
    global SAMPLES
    global DBmreadings
    global REFreadings
    global Referenceon
    global T1line
    global T2line
    global S1line
    global S2line
    global STOREtrace
    global X0L          # Left top X value
    global Y0T          # Left top Y value
    global GRW          # Screenwidth
    global GRH          # Screenheight
    global Vdiv         # Number of vertical divisions
    global STARTfrequency
    global STOPfrequency
    global CENTERsignalfreq
    global STARTsignalfreq
    global DBdivlist    # dB per division list
    global DBdivindex   # Index value
    global DBlevel      # Reference level
    global SAMPLErate

    # Set the TRACEsize variable
    TRACEsize = SAMPLES      # Set the trace length

    if TRACEsize == 0:              # If no trace, skip rest of this routine
        return()


    # Vertical conversion factors (level dBs) and border limits
    Yconv = float(GRH) / (Vdiv * DBdivlist[DBdivindex])     # Conversion factors from dBs to screen points 10 is for 10 * log(power)
    #Yc = float(Y0T) + GRH + Yconv * (DBlevel -80)           # Zero postion and -80 dB for in grid range
    Yc = float(Y0T) + GRH + Yconv * (DBlevel -(Vdiv * DBdivlist[DBdivindex]))           # Zero postion and -80 dB for in grid range
    Ymin = Y0T                                              # Minimum position of screen grid (top)
    Ymax = Y0T + GRH                                        # Maximum position of screen grid (bottom)

    # Horizontal conversion factors (frequency Hz) and border limits
    Fpixel = float(STOPfrequency - STARTfrequency) / GRW    # Frequency step per screen pixel
    #Fsample = float(SAMPLES) / (TRACEsize - 1)       # Frequency step per sample   
    Fsample = float(STOPfrequency - STARTfrequency) / (TRACEsize - 1)       # Frequency step per sample  

    T1line = []
    n = 0

    while n < TRACEsize:
        F = n * Fsample
        #if F >= STARTfrequency and F <= STOPfrequency:
            #x = X0L + (F - STARTfrequency)  / Fpixel
        if F <= STOPfrequency:
            x = X0L + F   / Fpixel
            T1line.append(int(x + 0.5))
            try:
                if Referenceon:
                    y =  Yc - Yconv * (DBmreadings[n]-REFreadings[n])
                else:
                    y =  Yc - Yconv * DBmreadings[n]  # 
                #y =  Yc + Yconv * 10 * DBmreadings[n]  # 
                #print y
            except:
                y = Ymax
            #print DBmreadings[n]
            if (y < Ymin):
                y = Ymin
            if (y > Ymax):
                y = Ymax
            T1line.append(int(y + 0.5))

        n = n + 1               



def MakeScreen():       # Update the screen with traces and text
    global X0L          # Left top X value
    global Y0T          # Left top Y value
    global GRW          # Screenwidth
    global GRH          # Screenheight
    global T1line
    global T2line
    global S1line
    global S2line
    global STOREtrace
    global Vdiv         # Number of vertical divisions
    global RUNstatus    # 0 stopped, 1 start, 2 running, 3 stop now, 4 stop and restart
    global AUDIOstatus  # 0 audio off, 1 audio on
    global UPDATEspeed
    global STARTfrequency
    global STOPfrequency
    global CENTERsignalfreq
    global STARTsignalfreq
    global STOPsignalfreq
    global SNenabled
    global SNmeasurement
    global SNresult
    global DBdivlist    # dB per division list
    global DBdivindex   # Index value
    global DBlevel      # Reference level
    global SAMPLErate
    global TRACEmode    # 1 normal 2 max 3 average
    global TRACEaverage # Number of traces for averageing
    global AUDIOlevel   # Level of audio input 0 to 1
    global FFTwindow
    global COLORgrid    # The colors
    global COLORtrace1
    global COLORtrace2
    global COLORtext
    global COLORsignalband
    global COLORaudiobar
    global COLORaudiook 
    global COLORaudiomax
    global COLORMarker1
    global COLORMarker2
    global CANVASwidth
    global CANVASheight
    global RXbuffer
    global RXbufferoverflow
    global REFstore
    global Referenceon
    global Marker1x
    global Marker1y
    global Marker2x
    global Marker2y
    
    # Delete all items on the screen
    de = ca.find_enclosed ( 0, 0, CANVASwidth+1000, CANVASheight+1000)    
    for n in de: 
        ca.delete(n)
 

    # Draw horizontal grid lines
    i = 0
    x1 = X0L
    x2 = X0L + GRW
    x3 = x1+2     # db labels X location
    db= DBlevel

    while (i <= Vdiv):
        y = Y0T + i * GRH/Vdiv
        Dline = [x1,y,x2,y]
        ca.create_line(Dline, fill=COLORgrid)
        txt = str(db) # db labels
        idTXT = ca.create_text (x3, y-5, text=txt, anchor=W, fill=COLORtext)
        db = db - DBdivlist[DBdivindex]
        i = i + 1


    # Draw vertical grid lines
    i = 0
    y1 = Y0T
    y2 = Y0T + GRH
    freq= STARTfrequency
    freqstep= (STOPfrequency-STARTfrequency)/10
    while (i < 11):
        x = X0L + i * GRW/10
        Dline = [x,y1,x,y2]
        ca.create_line(Dline, fill=COLORgrid)
        txt = str(freq/1000000) # freq labels in mhz
        txt= txt + "M"
        idTXT = ca.create_text (x-10, y2+10, text=txt, anchor=W, fill=COLORtext)
        freq=freq+freqstep
        i = i + 1


    # Draw traces
    if len(T1line) > 4:                                     # Avoid writing lines with 1 coordinate    
        ca.create_line(T1line, fill=COLORtrace1)            # Write the trace 1

    if STOREtrace == True and len(T2line) > 4:              # Write the trace 2 if active
        ca.create_line(T2line, fill=COLORtrace2)            # and avoid writing lines with 1 coordinate

    # Start and stop frequency and dB/div and trace mode
    txt = str(STARTfrequency/1000000) + "MHz to " + str(STOPfrequency/1000000) + " MHz"
    txt = txt +  "    " + str(DBdivlist[DBdivindex]) + " dB/div"
    txt = txt + "    Level: " + str(DBlevel) + " dB "

    if TRACEmode == 1:
        txt = txt + "    Normal mode "

    if TRACEmode == 2:
        txt = txt + "    Maximum hold mode "
    
    if TRACEmode == 3:
        txt = txt + "    Power average  mode (" + str(TRACEaverage) + ") "
        
    x = X0L +300
    y = Y0T+GRH+40
    idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORtext)


    if Referenceon == True:
        txt = " REF ON"
        x = X0L +700
        y = Y0T+GRH+40
        idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORred)
    else:
        txt = " REF OFF"
        x = X0L +700
        y = Y0T+GRH+40
        idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORtext)
        
    if REFstore == 1:
        txt = "CALIBRATING"
     
        x = X0L +430
        y = Y0T+40
        idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORred)

    # Runstatus and level information
    if (RUNstatus == 0) or (RUNstatus == 3):
        txt = "Sweep stopped"
    else:
        txt = "Sweep running"

    x = X0L 
    y = Y0T+GRH+40
    IDtxt  = ca.create_text (x, y, text=txt, anchor=W, fill=COLORtext)

    txt = str(SAMPLES)+ " Samples per Sweep "
        
    x = X0L + 100
    y = Y0T+GRH+40
    idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORtext)

# show the values at the mouse cursor
# note the magic numbers below were determined by looking at the cursor values
# not sure why they don't correspond to X0T and Y0T
    cursorx = (STARTfrequency + (root.winfo_pointerx()-root.winfo_rootx()-X0L-4) * (STOPfrequency-STARTfrequency)/GRW) /1000000
    cursory = DBlevel - (root.winfo_pointery()-root.winfo_rooty()-Y0T-50) * Vdiv*DBdivlist[DBdivindex] /GRH 
    
    txt = "Cursor " + str(cursorx)  + " MHz   " + str(cursory) + " dB"
        
    x = X0L + 40
    y = Y0T -10
    idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORtext)

    Marker1valid=False
    if ((Marker1x > 20) & (Marker1y >20)): # show on screen markers
        Marker1valid=True
        idTXT = ca.create_text (Marker1x-3, Marker1y+4, text="^", anchor=W, fill=COLORMarker1)
        Marker1freq = (STARTfrequency + (Marker1x-19) * (STOPfrequency-STARTfrequency)/GRW) /1000000
        Marker1db = DBlevel - (Marker1y-20) * Vdiv*DBdivlist[DBdivindex] /GRH 
        txt = "Marker1 " + str(Marker1freq)  + " MHz   " + str(Marker1db) + " dB"    
        x = X0L + 300
        y = Y0T -10
        idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORMarker1)

    Marker2valid=False
    if ((Marker2x > 20) & (Marker2y >20)): # show on screen markers
        Marker2valid=True
        idTXT = ca.create_text (Marker2x-3, Marker2y+4, text="^", anchor=W, fill=COLORMarker2)
        Marker2freq = (STARTfrequency + (Marker2x-19) * (STOPfrequency-STARTfrequency)/GRW) /1000000
        Marker2db = DBlevel - (Marker2y-20) * Vdiv*DBdivlist[DBdivindex] /GRH 
        txt = "Marker2 " + str(Marker2freq)  + " MHz   " + str(Marker2db) + " dB"    
        x = X0L + 520
        y = Y0T -10
        idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORMarker2)
        
    # show marker delta only if both are valid
    if (Marker1valid & Marker2valid): 
        Deltafreq = abs(Marker2freq-Marker1freq)
        Deltadb = abs(Marker2db-Marker1db)
        txt = "Delta " + str(Deltafreq)  + " MHz   " + str(Deltadb) + " dB"    
        x = X0L + 750
        y = Y0T -10
        idTXT = ca.create_text (x, y, text=txt, anchor=W, fill=COLORtext)       
# ================ Make Screen ==========================

root=Tk()
root.title("VE3MKC Simple Scalar Network Analyzer")

root.minsize(100, 100)

frame1 = Frame(root, background=COLORframes, borderwidth=5, relief=RIDGE)
frame1.pack(side=TOP, expand=1, fill=X)

frame2 = Frame(root, background="black", borderwidth=5, relief=RIDGE)
frame2.pack(side=TOP, expand=1, fill=X)

frame3 = Frame(root, background=COLORframes, borderwidth=5, relief=RIDGE)
frame3.pack(side=TOP, expand=1, fill=X)

ca = Canvas(frame2, width=CANVASwidth, height=CANVASheight, background=COLORcanvas)
ca.bind("<Button-1>", Bmarker1)
ca.bind("<Button-3>", Bmarker2)
ca.pack(side=TOP)

b = Button(frame1, text="Average", width=Buttonwidth1, command=BAveragemode)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame1, text="Store trace", width=Buttonwidth1, command=BSTOREtrace)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame1, text="Auto Scale", width=Buttonwidth1, command=BAutoY)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame1, text="REF on/off", width=Buttonwidth1, command=Calonoff)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame1, text="REF Calibrate", width=Buttonwidth1, command=Calibrateref)
b.pack(side=RIGHT, padx=5, pady=5)


b = Button(frame3, text="Start", width=Buttonwidth2, command=BStart)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame3, text="Stop", width=Buttonwidth2, command=BStop)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame3, text="Startfreq", width=Buttonwidth2, command=BStartfrequency)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame3, text="Stopfreq", width=Buttonwidth2, command=BStopfrequency)
b.pack(side=LEFT, padx=5, pady=5)

b = Button(frame3, text="+Samples", width=Buttonwidth2, command=Bsamples2)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="-Samples", width=Buttonwidth2, command=Bsamples1)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="+dB/div", width=Buttonwidth2, command=BDBdiv2)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="-dB/div", width=Buttonwidth2, command=BDBdiv1)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="LVL+10", width=Buttonwidth2, command=Blevel4)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="LVL-10", width=Buttonwidth2, command=Blevel3)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="LVL+1", width=Buttonwidth2, command=Blevel2)
b.pack(side=RIGHT, padx=5, pady=5)

b = Button(frame3, text="LVL-1", width=Buttonwidth2, command=Blevel1)
b.pack(side=RIGHT, padx=5, pady=5)



#   self.Canvas.bind('<Button-1>', self.on_click)  # for cursor location

# ================ Call main routine ===============================
root.update()               # Activate updated screens

Sweep()




