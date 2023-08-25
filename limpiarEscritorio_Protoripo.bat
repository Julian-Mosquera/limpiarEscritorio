@echo off
setlocal enabledelayedexpansion

set "carpetaPrueba=C:\Users\ALUMNO\Desktop\aaaaaaaaaa"

cd /d "%carpetaPrueba%"

rem Separar la lista de archivos inmortales en un bucle
for %%F in (*) do (
    set "mantener=0"
    rem Comparar cada archivo en el directorio con el archivo inmortal actual
    for /f %%A in (archivosInmortales.txt) do (
        echo %%F
        if "%%~nxF" equ "%%~nxA" (
            set "mantener=1"
            echo !mantener!
            echo manteniendo
        )
    )
    if "!mantener!" equ "1" (
        echo se mantuvo
    ) else (
        del %%F 
        echo eliminado
        set "mantener=0"
    )
)

endlocal
echo funcionó?
pause