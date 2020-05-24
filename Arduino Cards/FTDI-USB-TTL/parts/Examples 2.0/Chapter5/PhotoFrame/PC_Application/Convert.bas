Attribute VB_Name = "Convert"
Option Explicit

Public Type PixelData
    Command As Byte
    X As Byte
    Y As Byte
    Color As Integer
    End Type

' Connect to some DLL's
' System DLL
Declare Sub Sleep Lib "Kernel32.dll" (ByVal Milliseconds As Long)
Declare Function OpenProcess Lib "Kernel32.dll" (ByVal Access As Long, ByVal Inherit As Integer, ByVal Object As Long) As Long
Declare Function WaitForSingleObject Lib "Kernel32.dll" (ByVal Handle As Long, ByVal Milliseconds As Long) As Long
Declare Function CloseHandle Lib "Kernel32.dll" (ByVal Handle As Long) As Long
' My color converter DLL
Declare Function ReportVersion Lib "Convert.dll" () As Long
Declare Function uLCD_Color Lib "Convert.dll" (ByVal Color As Long) As Integer
Declare Function VB_Color Lib "Convert.dll" (ByVal Color As Integer) As Long

Public Function INC(Name As String) As String
INC = Right$(Str$(1001 + Val(Name)), 3)
End Function

Public Function DEC(Name As String) As String
DEC = Right$(Str$(999 + Val(Name)), 3)
End Function

Public Function WaitForProcess(TaskID As Long) As Boolean
Dim Handle As Long
Handle = OpenProcess(&H100000, True, TaskID)
WaitForProcess = WaitForSingleObject(Handle, -1) <> -1
CloseHandle Handle
End Function


