# Init pre-commit
init-pre-commit:
    #!/bin/sh
    command -v pre-commit 2>&1 >/dev/null
    if [ $? -ne 0 ]; then
        echo "pre-commit tool needs to be installed"
        exit 1
    fi

    if [ -f ./.git/hooks/pre-commit ]; then
        echo "pre-commit script already installed"
        exit 1
    fi

    if [ ! -f ./.pre-commit-config.yaml ]; then
        cp just/common/tool/.pre-commit-config.yaml .
    fi

    pre-commit install
