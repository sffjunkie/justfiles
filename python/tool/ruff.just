lint_tools := 'ruff'

# Lint the source
lint:
    #!/bin/sh
    command -v ruff &>/dev/null
    if [ $? -eq 0 ]; then
        prefix=""
    else
        if [ -f /etc/NIXOS ]; then
            echo -e "{{color_red}}You need to install the ruff nixos package on Nixos{{color_normal}}" 1>&2;
            exit 1
        else
            prefix={{pypm_run}}
        fi
    fi

    ${prefix} ruff check --config "cache-dir = '{{cache_dir}}/ruff'" src/{{project_name}}
    if [ $? -eq 0 ]; then
        echo -e "{{color_green}}ruff: no problems found{{color_normal}}"
    fi
