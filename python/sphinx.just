docs_tool := 'sphinx'

init-docs:
    #!/bin/sh
    if [ -f src/docs/conf.py ]; then
        echo "Docs already initialised"
    else
        mkdir -p docs
        mkdir -p src/docs
        pdm add -dG dev sphinx
        user_name=$(git config user.name)
        sphinx-quickstart --project={{project}} --author=${user_name} ./src/docs/
    fi

build-docs:
    sphinx-build --builder html ./src/docs ./docs
