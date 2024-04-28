# Lint the source
project-lint:
    #!/bin/sh
    command -v ruff &>/dev/null  && prefix="" || prefix="pdm run"
    ${prefix} ruff check --config "cache-dir = '{{cache_dir}}/ruff'" src/{{project}}
    if [ $? -eq 0 ]; then
        echo "ruff: no problems found"
    fi
