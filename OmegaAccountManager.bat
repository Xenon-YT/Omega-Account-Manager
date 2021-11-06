@echo off
title Ilooh Omega Account Manager
echo        *** Ilooh Omega Account Manager 1.01***
echo     - (c) 2020-2021 Ilooh. All Rights reserved.-
echo.
timeout /t 2 /nobreak > NUL
:mainmenu
echo Sei nel menu principale:
echo.
echo Scegli cosa fare:
echo.
echo 1. Aggiungi un utente
echo 2. Elimina un utente
echo 3. Cambia password
echo 4. Lista utenti
echo 5. Informazioni e Aggiornamenti
echo 0. Esci dal programma
:cmdline
set /p menuchoice=La tua scelta (1,2,3,4.0):
if %menuchoice%==1 goto :adduser
if %menuchoice%==2 net users &goto :dus
if %menuchoice%==3 goto :chgpsw
if %menuchoice%==4 net users
if %menuchoice%==5 echo Puoi Verificare gli aggiornamenti sul nostro sito, https://iloohtechnology.it/ &start https://iloohtechnology.it/
if %menuchoice%==0 exit
goto :cmdline

:adduser
cls
set /p newuname=Inserisci il nome utente(per annullare premi 0):
if %newuname%==0 cls &goto :mainmenu

set /p pwyon=Vuoi che l'utente abbia una password(Scrivi 's' per si o 'n' per no)?
if %pwyon%==s goto :pwyes
if %pwyon%==n goto :pwno

:pwyes
set /p psw=Scrivi la password che vorresti abbia l'utente:
net user %newuname% %psw% /ADD
timeout /t 2 /nobreak > NUL
cls
goto :mainmenu

:pwno
net user /add %newuname%
timeout /t 2 /nobreak > NUL
cls
goto :mainmenu








:dus
cls
net users
set /p deusname=Scrivi il nome dell'account da eliminare(per annullare premi 0):
if %deusname%==0 cls &goto :mainmenu

net user /delete %deusname%
timeout /t 2 /nobreak > NUL
cls
goto :mainmenu








:chgpsw
cls
net users
set /p  upsw=Qual e' il nome utente a cui cambiare password?Usa copia e incolla (premere 0 per annullare):
if %upsw%==0 cls &goto :mainmenu

set /p  newpass=Scrivi la nuova password (premere 0 per annullare):
if %newpass%==0 cls &goto :mainmenu

net user %upsw% %newpass%
timeout /t 2 /nobreak > NUL
cls
goto :mainmenu

pause







