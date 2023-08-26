@echo off
rem cambia la página de códigos de la consola a UTF-8
chcp 65001 
setlocal enabledelayedexpansion

rem script para eliminar archivos de un directorio dado

rem Agregar directorio y archivo .txt con los nombres de los archivos a guardar
set "directorio="
set "whitelist="

cd /d "%directorio%"

for %%F in (*) do (
    set "mantener=0"
    for /f "usebackq delims=" %%A in ("%whitelist%") do (
        if "%%~nxF" equ "%%~nxA" (
            set "mantener=1"
        )
    )
    if "!mantener!" equ "0" (
        echo Eliminando archivo: "%%F"
        del "%%F"
    )
)

endlocal
pause