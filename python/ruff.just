lint_tools := 'ruff'

# Lint the source
lint:
    #!/bin/sh
    command -v ruff &>/dev/null  && prefix="" || prefix={{pypm_run}}
    ${prefix} ruff check --config "cache-dir = '{{cache_dir}}/ruff'" src/{{project_name}}
    if [ $? -eq 0 ]; then
        echo "ruff: no problems found"
    fi
