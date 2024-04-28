default_language := 'python'
default_stage := 'project'  # or 'bluesky'

just_repo := 'https://github.com/sffjunkie/just'
just_branch := 'poc'

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")

default:
    @just --list --unsorted

[no-cd]
init-project name language=default_language:
    #!/bin/sh
    if [ ! -d "{{dev_home}}/project/{{name}}" ]; then
        mkdir -p "{{dev_home}}/project/{{name}}"
        echo "PROJECT_NAME={{name}}" > {{dev_home}}/project/{{name}}/.project
        echo "PROJECT_LANGUAGE={{language}}" >> {{dev_home}}/project/{{name}}/.project
    else
        echo "Project {{name}} already exists"
    fi

[no-cd]
init-bluesky name language=default_language:
    #!/bin/sh
    if [ ! -d "{{dev_home}}/bluesky/{{name}}" ]; then
        mkdir -p "{{dev_home}}/bluesky/{{name}}"
        echo "PROJECT_NAME={{name}}" > {{dev_home}}/bluesky/{{name}}/.project
        echo "PROJECT_LANGUAGE={{language}}" >> {{dev_home}}/bluesky/{{name}}/.project
    else
        echo "Blueskey project {{name}} already exists"
    fi

[no-cd]
init-just:
    #!/bin/sh
    if [ ! -f ./.project ]; then
        echo "Not in a managed project"
        exit 1
    fi
    
    if [ ! -d ./just ]; then
        echo "Retrieving branch '{{just_branch}}' from '{{just_repo}}'"
        git clone -b {{just_branch}} {{just_repo}} just
    fi

    [ ! -h Justfile ] && ln -s just/Justfile Justfile || :
