' LogonMessage.vbs
' by Riccardo Bicelli <r.bicelli@gmail.com>
' This program is a proof of concept script for demonstrating how to write ADMX Templates

' Registry Base
Const REG_BASE = "HKEY_CURRENT_USER\Software\Policies\MyCompany\LogonMessage"

' Used variables
Dim MsgBoxEnabled
Dim MsgBoxButtons
Dim MsgBoxIcons
Dim MsgBoxTitle
Dim MsgBoxPrompt

'Read Values From Registry

MsgBoxEnabled = readFromReg("MessageEnable", 0)

MsgBoxButtons = readFromReg("MessageButtons", 0)

MsgBoxIcon = readFromReg("MessageIcon", 0)

MsgBoxTitle = readFromReg("MessageTitle", "")

MsgBoxPrompt = readFromReg("MessagePrompt", "")


If MsgBoxEnabled=1 Then

	MsgBox MsgBoxPrompt, MsgBoxButtons + MsgBoxIcon, MsgBoxTitle
         
End If


' Functions Library
' ReadFromReg Function
' Reads a Registry Key from REG_BASE
function readFromReg (sRegKey, sDefaultValue )
    Dim WSHShell, value

    On Error Resume Next
    Set WSHShell = CreateObject("WScript.Shell")
    value = WSHShell.RegRead( REG_BASE & "\" & sRegKey )

    if err.number <> 0 then
        readFromReg = sDefaultValue
    else
        readFromReg = value
    end if
	'msgbox ReadFromReg
    set WSHShell = nothing
end function