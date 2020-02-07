import sys
import os
from github import Github

project_type = str(sys.argv[1])
project_name = str(sys.argv[2])
is_repo_private = str(sys.argv[3])
project_dir = str(sys.argv[4])
path = project_dir + '/' + project_type

# There are safer ways of inputting these values
# like getting a token but for personal use this is fine
# for the time being
username = 'username here'   # Github username
password = 'password here'   # Github password

def create():
    # Chane working directory for script to project directory
    os.chdir(path)

    # Make new porject folder in directory
    os.makedirs(project_name)

    # Make project repository
    user = Github(username, password).get_user()
    user.create_repo(name=project_name, private=string_to_bool(is_repo_private))
    print("Succesfully created repository {}".format(project_name))

# New to python so there might be a better way
# but this just turns the repo privacy argument (true or false)
# from string to python boolean
def string_to_bool(value):
    if value.lower() in ('yes', 'true', 't', 'y', '1'):
        return True
    elif value.lower() in ('no', 'false', 'f', 'n', '0'):
        return False    

if __name__ == "__main__":
    create()