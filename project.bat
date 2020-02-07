@ECHO off

REM Address these vars according to your machine/prefs
REM PROJECT_DIR E.G. C:/Users/user/Documents/Projects
set PROJECT_DIR=C:/Users/username here/OneDrive/Documents/Projects
set GITHUB_USERNAME=username here

set PROJECT_TYPE=
set PROJECT_NAME=%1
set IS_REPO_PRIVATE=

REM Enter list of project types here
REM Remember to change the conditionals too
REM I know, I know... There's a better method for those conditionals

:type_of_project
ECHO.
ECHO Type of project?
ECHO 1. Application
ECHO 2. Unity
ECHO 3. Website
ECHO 4. Utility
set choice=
set /p choice=Choose...  
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' ( 
    set PROJECT_TYPE=Application
    goto :is_repo_private
)
if '%choice%'=='2' (
    set PROJECT_TYPE=Unity
    goto :is_repo_private
)
if '%choice%'=='3' (
    set PROJECT_TYPE=Website
    goto :is_repo_private
)
if '%choice%'=='4' (
    set PROJECT_TYPE=Utility
    goto :is_repo_private
)
ECHO "%choice%" is not valid, try again
ECHO.
goto :type_of_project

:is_repo_private
set /P c=Private repository [y/n]? 
if /I "%c%" EQU "Y" (
    set IS_REPO_PRIVATE=true
    goto :final
)
if /I "%c%" EQU "N" (
    set IS_REPO_PRIVATE=false 
    goto :final
)
goto :is_repo_private

:final
if EXIST %PROJECT_DIR%/%PROJECT_TYPE%/ (
    python %~dp0create.py %PROJECT_TYPE% %PROJECT_NAME% %IS_REPO_PRIVATE% %PROJECT_DIR%
    cd %PROJECT_DIR%/%PROJECT_TYPE%/%PROJECT_NAME%/
    git init
    ECHO "# %PROJECT_NAME%" >> README.md
    git remote add origin https://github.com/%GITHUB_USERNAME%/%PROJECT_NAME%.git
    git add README.md
    git commit -m "Initial commit"
    git push -u origin master
    ECHO Succesfully created new project! 
    code .
) else (
    ECHO [!!!] %PROJECT_DIR%/%PROJECT_TYPE%/%PROJECT_NAME%/ Directory does not exist!
    ECHO Double check PROJECT_DIR is set properly before restarting.
    ECHO Press any key to restart...
    PAUSE >nul
    cls
    goto :type_of_project
)

:end