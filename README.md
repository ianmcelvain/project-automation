# About

Automatically creates project folder with initial commit for the new repository made and opens VS Code in the project directory with one command:
```
$ project NewProject
```
Not original idea but I wanted something to automate for multiple project types and a couple of prompts such as "Do you want this repository private?" for more flexibility down the road.


## Install [READ!!!]

```
- Python required
- Add folder to eniroment path to call $ project <title> in cmd (to do this type "Edit the system enviroment variables" in windows start menu)
- pip install -r requirements.txt OR pip3 install -r requirements.txt (if on python 3)
- Change PROJECT_DIR (back slashes only) and GITHUB_USERNAME in project.bat
- Change the project types to your types in project.bat
- Change username and password to your GitHubs account in create.py
```

## Use

Open command prompt:

```
project ProjectTitle
```

No spaces in title and follow the prompts after
