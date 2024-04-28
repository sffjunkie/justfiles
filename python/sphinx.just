docs_tool := 'sphinx'

# Initialize docs directory with Sphinx
init-docs:
    #!/bin/sh
    if [ -f src/docs/conf.py ]; then
        echo "Docs already initialised"
    else
        [ ! -d ./docs ] && mkdir ./docs || :
        [ ! -d ./src/docs ] && mkdir -p ./src/docs || :
        user_name=$(git config user.name)
        cd ./src/docs
        {{pypm_run}} sphinx-quickstart \
            -v="0.1.0" \
            --release="0.1.0" \
            --project="{{project_name}}" \
            --author="${user_name}" \
            --language="en" \
            --no-sep
    fi

# Build docs with Sphinx
build-docs:
    {{pypm_run}} sphinx-build --builder html ./src/docs ./docs
