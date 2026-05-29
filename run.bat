@echo off

echo Running Piper...

cd /d "C:\Users\user\Documents\All projects\Content_engine\piper"

type "C:\Users\user\Documents\All projects\Content_engine\script.txt" | piper.exe --model "..\en_US-lessac-medium.onnx" --output_file "..\voice.wav"

echo Running FFmpeg...

ffmpeg -loop 1 -i "C:\Users\user\Documents\All projects\Content_engine\image.jpg" -i "C:\Users\user\Documents\All projects\Content_engine\voice.wav" -c:a aac -shortest "C:\Users\user\Documents\All projects\Content_engine\video.mp4"

echo DONE
pause