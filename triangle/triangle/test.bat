set PROGRAM="../Debug/triangle.exe"

REM Проверка на запуск программы без указания сторон
%PROGRAM% > output.txt
if not errorlevel 1 goto err
fc output.txt fail.txt
if errorlevel 1 goto err

REM Проверка на запуск программы с 1 стороной
%PROGRAM% 1 > output.txt
if not errorlevel 1 goto error
fc output.txt fail.txt
if errorlevel 1 goto err

REM Проверка на запуск программы с 2 сторонами
%PROGRAM% 1 2 > output.txt
if not errorlevel 1 goto err
fc output.txt fail.txt
if errorlevel 1 goto err

REM Проверка на запуск программы с некорректными сторонами 
%PROGRAM% a b c > output.txt
if not errorlevel 1 goto err

REM Проверка на запуск программы с 4 сторонами
%PROGRAM% 1 2 3 4 > output.txt
if not errorlevel 1 goto err
fc output.txt fail.txt
if errorlevel 1 goto err

REM Проверка на запуск программы с некорректными сторонами
%PROGRAM% a 3 c > output.txt
if not errorlevel 1 goto err

REM Проверка для не треугольника
%PROGRAM% 1 2 3 > output.txt
if not errorlevel 1 goto err
fc output.txt not_tr.txt
if errorlevel 1 goto err

REM Проверка для равностороннего треугольника
%PROGRAM% 12 12 12 > output.txt
if errorlevel 1 goto err
fc output.txt equilateral.txt
if errorlevel 1 goto err

REM Проверка для равностороннего треугольника с точкой-разделителем
%PROGRAM% 1.1 1.1 1.1 > output.txt
if errorlevel 1 goto err
fc output.txt equilateral.txt
if errorlevel 1 goto err

REM Проверка для равностороннего треугольника с запятой-разделителем
%PROGRAM% 1,1 1,1 1,1 > output.txt
if errorlevel 1 goto err
fc output.txt equilateral.txt
if errorlevel 1 goto err

REM Проверка для равнобедренного треугольника
%PROGRAM% 10 15 15 > output.txt
if errorlevel 1 goto err
fc output.txt isosceles.txt
if errorlevel 1 goto err

REM Проверка для обычного треугольника
%PROGRAM% 5 3 4 > output.txt
if errorlevel 1 goto err
fc output.txt simple.txt

if errorlevel 1 goto err
echo Program testing succeeded.
exit 0

:err
echo Program testing failed.
exit 1