set PROGRAM="../Debug/triangle.exe"

REM �������� �� ������ ��������� ��� �������� ������
%PROGRAM% > output.txt
if not errorlevel 1 goto err
fc output.txt fail.txt
if errorlevel 1 goto err

REM �������� �� ������ ��������� � 1 ��������
%PROGRAM% 1 > output.txt
if not errorlevel 1 goto error
fc output.txt fail.txt
if errorlevel 1 goto err

REM �������� �� ������ ��������� � 2 ���������
%PROGRAM% 1 2 > output.txt
if not errorlevel 1 goto err
fc output.txt fail.txt
if errorlevel 1 goto err

REM �������� �� ������ ��������� � ������������� ��������� 
%PROGRAM% a b c > output.txt
if not errorlevel 1 goto err

REM �������� �� ������ ��������� � 4 ���������
%PROGRAM% 1 2 3 4 > output.txt
if not errorlevel 1 goto err
fc output.txt fail.txt
if errorlevel 1 goto err

REM �������� �� ������ ��������� � ������������� ���������
%PROGRAM% a 3 c > output.txt
if not errorlevel 1 goto err

REM �������� ��� �� ������������
%PROGRAM% 1 2 3 > output.txt
if not errorlevel 1 goto err
fc output.txt not_tr.txt
if errorlevel 1 goto err

REM �������� ��� ��������������� ������������
%PROGRAM% 12 12 12 > output.txt
if errorlevel 1 goto err
fc output.txt equilateral.txt
if errorlevel 1 goto err

REM �������� ��� ��������������� ������������ � ������-������������
%PROGRAM% 1.1 1.1 1.1 > output.txt
if errorlevel 1 goto err
fc output.txt equilateral.txt
if errorlevel 1 goto err

REM �������� ��� ��������������� ������������ � �������-������������
%PROGRAM% 1,1 1,1 1,1 > output.txt
if errorlevel 1 goto err
fc output.txt equilateral.txt
if errorlevel 1 goto err

REM �������� ��� ��������������� ������������
%PROGRAM% 10 15 15 > output.txt
if errorlevel 1 goto err
fc output.txt isosceles.txt
if errorlevel 1 goto err

REM �������� ��� �������� ������������
%PROGRAM% 5 3 4 > output.txt
if errorlevel 1 goto err
fc output.txt simple.txt

if errorlevel 1 goto err
echo Program testing succeeded.
exit 0

:err
echo Program testing failed.
exit 1