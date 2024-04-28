name := '.'
type := 'python'
just_repo := 'https://github.com/sffjunkie/just'
just_branch := 'poc'

default:
    just --list

init: (init-project name) (init-just name)

[no-cd]
init-project name:
    #!/bin/sh
    mkdir -p ~/development/project/{{name}}
    cd ~/development/project/{{name}}

[no-cd]
init-just name=".":
    #!/bin/sh
    [ ! "{{name}}" = "." ] && cd ~/development/project/{{name}}

    if [ ! -d ./just ]; then
        echo "Extracting files from '{{just_repo}}' branch '{{just_branch}}'"
        git clone -b {{just_branch}} {{just_repo}} just
    fi

    [ ! -h Justfile ] && ln -s just/Justfile Justfile || :

update-just:
    cd ./just
    git
