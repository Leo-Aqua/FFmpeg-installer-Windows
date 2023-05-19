@echo off
title FFmpeg install
echo FFmpeg installation tool by LeoAqua
echo Do you really want to install FFmpeg?
:start
set /p prompt=[Y/N] 
if %prompt% == N (exit) else if %prompt% == n (exit)
if %prompt% == Y  (
:a
echo Downloading FFmpeg from gyan.dev ...
curl https://www.gyan.dev/ffmpeg/builds/packages/ffmpeg-5.1.2-essentials_build.zip -o c:/ffmpeg.zip -#
echo Done.
echo Unzipping...
powershell Expand-Archive -LiteralPath c:/ffmpeg.zip -DestinationPath c:/FFmpeg
echo Done.
echo Cleaning up...
cd c:/FFmpeg/ffmpeg-5.1.2-essentials_build
move bin ..
cd ..
rmdir ffmpeg-5.1.2-essentials_build /Q /S
cd ..
del ffmpeg.zip
echo Setting environment variable...
setx /M PATH "%PATH%;C:/FFmpeg/bin"
echo Done.
echo Installation finished!
pause
) else if %prompt% == y (goto a) else (echo Invalid Input! 
goto start)
