docs_tool_build := sphinx-build

init-docs:
    #!/bin/sh
    if [ -f src/docs/conf.py ]; then
        echo "Docs already initialised"
    else
        mkdir -p docs
        mkdir -p src/docs
        pdm add -dG dev {{docs_tool}}
        user_name=$(git config user.name)
        sphinx-quickstart --project={{project}} --author=${user_name} .
    fi
