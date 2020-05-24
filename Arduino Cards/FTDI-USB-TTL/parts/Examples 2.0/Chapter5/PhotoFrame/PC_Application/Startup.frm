VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Startup 
   Caption         =   "USB Design By Example: Imager"
   ClientHeight    =   5310
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12840
   LinkTopic       =   "Form1"
   ScaleHeight     =   5310
   ScaleWidth      =   12840
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Sound 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   5160
      TabIndex        =   13
      Text            =   "SelectSound"
      Top             =   2880
      Width           =   1935
   End
   Begin VB.CommandButton ToBeginning 
      Caption         =   "|<<"
      Height          =   495
      Left            =   2160
      TabIndex        =   10
      Top             =   3480
      Width           =   495
   End
   Begin VB.CommandButton Reverse 
      Caption         =   "<"
      Height          =   495
      Left            =   2880
      TabIndex        =   9
      Top             =   3480
      Width           =   495
   End
   Begin VB.CommandButton ToEnd 
      Caption         =   ">>|"
      Height          =   495
      Left            =   5280
      TabIndex        =   8
      Top             =   3480
      Width           =   495
   End
   Begin VB.CommandButton Forward 
      Caption         =   ">"
      Height          =   495
      Left            =   4560
      TabIndex        =   7
      Top             =   3480
      Width           =   495
   End
   Begin VB.CommandButton Save 
      Caption         =   "Save"
      Height          =   495
      Left            =   3600
      TabIndex        =   6
      Top             =   3480
      Width           =   735
   End
   Begin VB.ComboBox Transition 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   3000
      TabIndex        =   5
      Text            =   "Select Transition"
      Top             =   2880
      Width           =   1980
   End
   Begin VB.PictureBox PictureC 
      Height          =   1980
      Left            =   3000
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   128
      TabIndex        =   4
      Top             =   840
      Width           =   1980
   End
   Begin VB.PictureBox OffScreen 
      AutoSize        =   -1  'True
      Height          =   4215
      Left            =   8520
      ScaleHeight     =   277
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   253
      TabIndex        =   3
      Top             =   480
      Width           =   3855
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox PictureB 
      FillStyle       =   0  'Solid
      Height          =   1980
      Left            =   5160
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   128
      TabIndex        =   2
      Top             =   840
      Width           =   1980
   End
   Begin VB.TextBox Message 
      Height          =   375
      Left            =   1080
      TabIndex        =   1
      Text            =   "Debug Messages"
      Top             =   4680
      Width           =   6135
   End
   Begin VB.PictureBox PictureA 
      Height          =   1980
      Left            =   840
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   128
      TabIndex        =   0
      Top             =   840
      Width           =   1980
   End
   Begin VB.Label LabelB 
      Alignment       =   2  'Center
      Caption         =   "001"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5520
      TabIndex        =   12
      Top             =   360
      Width           =   1335
   End
   Begin VB.Label LabelA 
      Alignment       =   2  'Center
      Caption         =   "000"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1200
      TabIndex        =   11
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "Startup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Copyright 2007, John Hyde, USB Design By Example
'
' This example software is provided AS IS
' Since it is free I can offer no support, sorry
' You can use this for personal use only
' It cannot be published or used for commercial purposes without written permission
' Contact john@USB-By-Example.com for further information

Dim X_Offset() As String    ' Need two data arrays for the 'Dissolve' transition
Dim Y_Offset() As String    ' Need two data arrays for the 'Dissolve' transition
Dim SaveImgFile As Boolean  ' A flag tells me if the current transition+picture should be saved
Dim ImagerDir As String     ' Save the current working directory
Dim TaskID As Double        ' Non Zero when Windows Media Player is running

Private Sub Form_Load()
' Hide the Debug Messages line and the OffScreen Window
Startup.Height = 5000: Startup.Width = 8300
' Remember where I am
ImagerDir = CurDir: Message.Text = ImagerDir
' Populate Transition ComboBox
Transition.AddItem "Wipe Left"
Transition.AddItem "Wipe Right"
Transition.AddItem "Wipe Up"
Transition.AddItem "Wipe Down"
Transition.AddItem "Barn Door"
Transition.AddItem "Box In"
Transition.AddItem "Box Out"
Transition.AddItem "Diagonal Left"
Transition.AddItem "Diagonal Right"
Transition.AddItem "Venetian Blind"
Transition.AddItem "Dissolve"
' Initialize my two arrays for 'Dissolve' transition
X_Offset() = Split("0,1,3,2,0,2,3,1,0,3,3,0,2,1,1,2", ",")
Y_Offset() = Split("0,3,2,0,2,3,1,0,3,3,0,1,2,1,2,1", ",")
Sound.AddItem "No Sound"
Sound.AddItem "Matching Sound"
'Sound.AddItem "Play Sound" ' Disabled due to problems with Windows Media Player
End Sub

Private Sub Form_Activate()
' Form has become visible for the first time
Call ToBeginning_Click
End Sub

Private Sub LoadImg_A()
Dim Filename As String
Dim Pixel As PixelData
' Construct a filename from the label on Picture A
Filename = LabelA.Caption & ".img"
If (Dir$(Filename) <> "") Then
    Open Filename For Binary As #1
    Do While Seek(1) < LOF(1)
        Get #1, , Pixel
        PictureA.PSet (Pixel.X, Pixel.Y), VB_Color(Pixel.Color)
        Loop
    Close #1
Else
    PictureA.BackColor = vbBlack
    PictureA.Cls
    End If
End Sub

Private Sub LoadImg_B()
Dim Filename As String
Dim Pixel As PixelData
' Construct a filename from the label on Picture B
Filename = LabelB.Caption & ".img"
If (Dir$(Filename) <> "") Then
    Open Filename For Binary As #1
    Do While Seek(1) < LOF(1)
        Get #1, , Pixel
        PictureB.PSet (127 - Pixel.X, 127 - Pixel.Y), VB_Color(Pixel.Color)
        Loop
    Close #1
Else
    PictureB.BackColor = vbBlack
    PictureB.Cls
    End If
Filename = LabelB.Caption & ".mp3"
If (Dir$(Filename) = "") Then Sound.Text = "No sound" Else Sound.Text = "Matching sound"
End Sub

Private Sub PictureB_Click()
' Present the user a dialog box to open a picture file, then load it into this picture B
CD.DialogTitle = "Please select picture file "
CD.Filename = ""
CD.Filter = "Picture Files|*.jpg;*.bmp;*.gif"
CD.FilterIndex = 1
CD.Flags = cdlOFNFileMustExist
CD.CancelError = True
CD.ShowOpen
' Selected graphic could be any size, copy it to an off screen buffer
OffScreen.Picture = LoadPicture(CD.Filename)
ChDrive ImagerDir: ChDir ImagerDir
' Now resize it into Picture B
PictureB.PaintPicture OffScreen.Picture, 0, 0, 128, 128
End Sub

Private Sub Sound_Click()
Dim Filename As String
Dim Quote As String
Dim LocalTaskID As Long
Filename = LabelB.Caption + ".mp3"
Select Case Sound.ListIndex
Case 0: ' No sound
    If (Dir$(Filename) <> "") Then Kill Filename
Case 1: ' Set sound
' Present the user a dialog box to select an MP3 file
    CD.DialogTitle = "Please select picture file "
    CD.Filename = ""
    CD.Filter = "Audio Files|*.mp3"
    CD.FilterIndex = 1
    CD.Flags = cdlOFNFileMustExist
    CD.CancelError = True
    CD.ShowOpen
' Make a copy of this file with a <index>.mp3 name
    FileCopy CD.Filename, ImagerDir & "\" & Filename
    ChDrive ImagerDir: ChDir ImagerDir
    Sound.Text = "Matching Sound"
Case 2: ' Play sound
' I couldn't get this to work correctly, so this feature is disabled until the next version
' Note that the media player clears my pictures, so I must repaint them once media player exits
    Quote = Chr$(34)    'wmplayer takes a DOS path which cannot have spaces!!!!
    Message.Text = "Calling Media Player"
    TaskID = Shell("C:\Program Files\Windows Media Player\wmplayer.exe " & Quote & ImagerDir & "\" & Filename & Quote, vbMaximizedFocus)
    AppActivate TaskID
    SendKeys "^P"   ' Play
    Sound.AddItem "Stop Sound"
Case 3: ' Stop Sound
' I couldn't get this to work correctly, so this feature is disabled until the next version
    AppActivate TaskID
    SendKeys "^S"
    Sound.RemoveItem (3)
    TaskID = 0
End Select
End Sub

Private Sub ToBeginning_Click()
LabelA.Caption = "000": Call LoadImg_A
LabelB.Caption = "001": Call LoadImg_B
End Sub

Private Sub Reverse_Click()
Dim X As Integer, Y As Integer
If (LabelA.Caption <> 0) Then
    LabelB.Caption = LabelA.Caption
    For X = 0 To 127: For Y = 0 To 127: PictureB.PSet (X, Y), PictureA.Point(X, Y): Next Y: Next X
    LabelA.Caption = DEC(LabelA.Caption)
    Call LoadImg_A
    End If
End Sub

Private Sub Save_Click()
Message.Text = "Saving " & LabelB.Caption & ".img"
Open LabelB.Caption & ".img" For Binary As #2
SaveImgFile = True
Call Transition_Click
Close #2
SaveImgFile = False
' Now update the display
Call Forward_Click
End Sub

Private Sub Forward_Click()
Dim X As Integer, Y As Integer
LabelA.Caption = LabelB.Caption
For X = 0 To 127: For Y = 0 To 127: PictureA.PSet (X, Y), PictureB.Point(X, Y): Next Y: Next X
LabelB.Caption = INC(LabelB.Caption)
Call LoadImg_B
End Sub

Private Sub ToEnd_Click()
LabelB.Caption = "001"
Do While (Dir$(LabelB.Caption + ".img") <> ""): LabelB.Caption = INC(LabelB.Caption): Loop
LabelA.Caption = DEC(LabelB.Caption)
Call LoadImg_A
Call LoadImg_B
End Sub

Private Sub SetPixel(X As Integer, Y As Integer)
Dim Pixel As PixelData
Dim Color As Long
Dim Delay As Integer
Color = PictureB.Point(X, Y)
PictureC.PSet (X, Y), Color
If SaveImgFile Then
    Pixel.Command = Asc("P")
    Pixel.X = 127 - X
    Pixel.Y = 127 - Y
    Pixel.Color = uLCD_Color(Color)
    Put #2, , Pixel
    End If
' Add a delay so this operates the same speed as the real uLCD display
For Delay = 0 To 6000: Color = Delay: Next Delay
End Sub

Private Sub Transition_Click()
Dim i As Integer, j As Integer, k As Integer
Dim X As Integer, Y As Integer
' First copy Picture A into transition window
For X = 0 To 127: For Y = 0 To 127: PictureC.PSet (X, Y), PictureA.Point(X, Y): Next Y: Next X
Call Sleep(2000)    ' Show the current picture for 2 seconds
' Now show the effect of the transition.  Transition order/number set in Form_Load
Select Case Transition.ListIndex
' First four are the simple wipes
Case 0: For X = 0 To 127: For Y = 0 To 127: Call SetPixel(X, Y): Next Y: Next X
Case 1: For X = 0 To 127: For Y = 0 To 127: Call SetPixel(127 - X, Y): Next Y: Next X
Case 2: For Y = 0 To 127: For X = 0 To 127: Call SetPixel(X, 127 - Y): Next X: Next Y
Case 3: For Y = 0 To 127: For X = 0 To 127: Call SetPixel(X, Y): Next X: Next Y
Case 4: 'Barn door
    For i = 0 To 63
        X = 63 - i: For Y = 0 To 127: Call SetPixel(X, Y): Next Y
        X = 64 + i: For Y = 0 To 127: Call SetPixel(X, Y): Next Y
        Next i
Case 5: 'Box In
    For i = 0 To 63
        X = i: For Y = i To 127 - i: Call SetPixel(X, Y): Next Y
        Y = 127 - i: For X = i To 127 - i: Call SetPixel(X, Y): Next X
        X = 127 - i: For Y = i To 127 - i: Call SetPixel(X, Y): Next Y
        Y = i: For X = i To 127 - i: Call SetPixel(X, Y): Next X
        Next i
Case 6: 'Box Out
    For i = 0 To 63
        X = 63 - i: For Y = X To 64 + i: Call SetPixel(X, Y): Next Y
        Y = 64 + i: For X = 63 - i To 64 + i: Call SetPixel(X, Y): Next X
        X = 64 + i: For Y = 63 - i To X: Call SetPixel(X, Y): Next Y
        Y = 63 - i: For X = 63 - i To 64 + i: Call SetPixel(X, Y): Next X
        Next i
Case 7: 'Diagonal Left
    For i = 0 To 255
        For X = 0 To i
            Y = i - X: If ((X >= 0) And (X < 128) And (Y >= 0) And (Y < 128)) Then Call SetPixel(X, Y)
            Next X
        Next i
Case 8: 'Diagonal Right
    For i = 255 To 0 Step -1
        For X = 0 To i
            Y = i - X: If ((X >= 0) And (X < 128) And (Y >= 0) And (Y < 128)) Then Call SetPixel(X, Y)
            Next X
        Next i
Case 9: 'Venetian Blind
    For i = 0 To 15
        For j = 0 To 7: For X = 0 To 127: Call SetPixel(X, (16 * j) + i): Next X: Next j
        Next i
Case 10: 'Dissolve
    For i = 0 To 15: For j = 0 To 3: For k = 0 To 3: For X = 0 To 7: For Y = 0 To 7
    Call SetPixel(32 * X_Offset((j * 4) + k) + (X * 4) + X_Offset(i), 32 * Y_Offset((j * 4) + k) + (Y * 4) + Y_Offset(i))
    Next Y: Next X: Next k: Next j: Next i
End Select
Call Sleep(2000)    ' Show the final picture for 2 seconds
PictureC.Cls        ' Now clear the transition window
End Sub

