
:: This file loads the Visual Studio environment variables and then starts visual studio code.

@ECHO off

:: First load the VsDevCmd batch 
CALL "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\VsDevCmd.bat"

:: Start Vs code now. The path below is local user profile installation(not system wide) of vs code.
:: If you have system wide installation, get that path and then use it.
:: Note the dot(.) argument in the end in the following line.
START "" "C:\Users\koppviv\AppData\Local\Programs\Microsoft VS Code\code.exe" .

