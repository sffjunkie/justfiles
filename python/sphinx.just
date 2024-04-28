docs_tool := 'sphinx'

init-docs:
    #!/bin/sh
    if [ -f src/docs/conf.py ]; then
        echo "Docs already initialised"
    else
        [ -d ./docs ] && mkdir ./docs || :
        [ -d ./src/docs ] && mkdir -p ./src/docs || :
        user_name=$(git config user.name)
        cd ./src/docs
        {{pypm_run}} sphinx-quickstart \
            --project={{project}} \
            --author=${user_name} \
            --version=0.1.0 --release=0.1.0 \
            --language=en
    fi

build-docs:
    {{pypm_run}} sphinx-build --builder html ./src/docs ./docs
