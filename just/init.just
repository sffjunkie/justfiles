name := '.'
type := 'python'
just_repo := 'https://github.com/sffjunkie/just'
just_branch := 'poc'

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")
project_home := env_var_or_default("DEVELOPMENT_PROJECT_HOME", dev_home)

default:
    just --list

init: (init-project name type) (init-just name)

[no-cd]
init-project name:
    #!/bin/sh
    if [ ! -d "{{project_home}}/{{name}}" ]; then
        mkdir -p ~/development/project/{{name}}
        echo "[project]" > {{project_home}}/{{name}}/.project
        echo "name={{name}}" >> {{project_home}}/{{name}}/.project
    else
        echo "Project {{name}} already exists"
    fi

[no-cd]
init-just name=".":
    #!/bin/sh
    [ ! "{{name}}" = "." ] && cd ~/development/project/{{name}}

    if [ ! -d ./just ]; then
        echo "Extracting files from '{{just_repo}}' branch '{{just_branch}}'"
        git clone -b {{just_branch}} {{just_repo}} just
    fi

    [ ! -h Justfile ] && ln -s just/Justfile Justfile || :
