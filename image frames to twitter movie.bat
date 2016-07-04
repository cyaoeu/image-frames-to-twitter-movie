@ECHO OFF
ECHO "%~1"
FOR /R %%a IN (*.png) DO mogrify -background white -alpha remove "%%~a"
set filename=%~n1
set filename=%filename:~0,-4%
ffmpeg -i "%~d1%~p1%filename%%%04d.png" -vf scale=1280:720 -vcodec libx264 -profile:v baseline -pix_fmt yuv420p "%~n1.mp4"
set /p=