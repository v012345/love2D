@echo off
if not exist build mkdir build
if exist build\game.love del build\game.love
if exist build\game.zip del build\game.zip

:: 用 PowerShell 打包 assets 文件夹内的所有文件
powershell -Command "Compress-Archive -Path '.\assets\*' -DestinationPath 'build\game.zip'"
rename build\game.zip game.love

:: 合并 love.exe + game.love = 独立可执行文件
copy /b ".\love.exe"+"build\game.love" "build\game.exe"

copy liblove.dll build\liblove.dll
copy SDL3.dll build\SDL3.dll
copy lua51.dll build\lua51.dll
copy OpenAL32.dll build\OpenAL32.dll

echo Build complete: build\game.exe