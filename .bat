@echo off
setlocal

:: === Настройки ===
set ZIP_URL=https://github.com/Khudaybergan/lms_extension/archive/refs/heads/main.zip
set ZIP_NAME=lms_extension-main.zip
set EXT_FOLDER=%~dp0lms_extension-main

:: === Скачивание ZIP ===
echo 🔽 Скачиваем расширение...
powershell -Command "Invoke-WebRequest %ZIP_URL% -OutFile %ZIP_NAME%"

:: === Распаковка ZIP ===
echo 📦 Распаковываем...
powershell -Command "Expand-Archive -Force %ZIP_NAME% %EXT_FOLDER%"

:: === Установка в Chrome (вручную, будет предупреждение) ===
echo 📂 Открой Chrome и включи 'Developer mode', затем загрузи расширение из:
echo %EXT_FOLDER%
start chrome://extensions

:: === Очистка и самоудаление ===
timeout /t 10
del "%ZIP_NAME%"
echo 🧹 Очистка завершена.

:: === Самоудаление ===
echo del "%%~f0" >> cleanup.bat
start "" /min cleanup.bat
exit
