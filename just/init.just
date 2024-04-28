project_language := 'python'
project_stage := 'project'  # or 'bluesky'

just_repo := 'https://github.com/sffjunkie/just'
just_branch := 'poc'

home_dir := env_var('HOME')
dev_home := env_var_or_default("DEVELOPMENT_HOME", home_dir + "/development")

default:
    @just --list --unsorted

init: (init-project project_name project_language) (init-just project_name)

[no-cd]
init-project project_name project_language=project_language project_stage=project_stage:
    #!/bin/sh
    if [ ! -d {{dev_home}}/{{project_stage}}/{{name}} ]; then
        mkdir -p {{dev_home}}/{{project_stage}}/{{name}}
        echo "PROJECT_NAME={{name}}" > {{dev_home}}/{{project_stage}}/{{name}}/.project
        echo "PROJECT_LANGUAGE={{project_language}}" >> {{dev_home}}/{{project_stage}}/{{name}}/.project
    else
        echo "Project {{name}} already exists"
    fi

[no-cd]
init-just name=".":
    #!/bin/sh
    [ ! "{{name}}" = "." ] && cd {{dev_home}}/{{project_stage}}/{{name}}

    if [ ! -d ./just ]; then
        echo "Extracting files from '{{just_repo}}' branch '{{just_branch}}'"
        git clone -b {{just_branch}} {{just_repo}} just
    fi

    [ ! -h Justfile ] && ln -s just/Justfile Justfile || :
