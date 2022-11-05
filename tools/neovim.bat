@echo off
FOR /F %%i IN ('cd') DO set CUR_FOLDER=%%~nxi
title %CUR_FOLDER%
nvim 
