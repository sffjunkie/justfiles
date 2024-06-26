pypm := 'pdm'
pypm_run := 'pdm run'
pypm_add := 'pdm add'
pypm_add_dev := 'pdm add -dG dev'

# Display python information
python-info:
    #!/usr/bin/env -S pdm run python
    import sys
    print(f"python prefix:   {sys.prefix}")
    print(f"python version:  {sys.version}")
    print(f"python platform: {sys.platform}")
    print(f"python path:     {sys.path[0]}")
    for path in sys.path[1:]:
        print(f"                 {path}")

# Build the project
build *args:
	pdm build {{args}}

# Update the project dependencies
update *args:
	pdm update {{args}}

# Add distribution
add +names:
    #!/bin/sh
    [ ! -f pyproject.toml ] && echo "The pyproject.toml has not been initialized yet. You can do this by running \`just init-devenv\`" && exit 1
    pdm add {{quote(names)}}

# Add distribution for development
add-dev +names:
    #!/bin/sh
    [ ! -f pyproject.toml ] && echo "The pyproject.toml has not been initialized yet. You can do this by running \`just init-devenv\`" && exit 1
    pdm add -dG dev {{quote(names)}}

# Run python code 
run *args:
    pdm run dotenv run -- python -c '{{args}}'

# Run the project's module
run-module *args:
    pdm run dotenv run -- python -m {{project_name}} {{args}}

# Create a pyproject.toml 
[private]
init-pyproject:
    #!/bin/sh
    if grep -q "PYTHON_VERSION=" {{dotenv_filename}}; then
        touch .env
        py_ver=$(sed -nE "s/^PYTHON_VERSION=([0-9]+(\.[0-9]+(\.[0-9]+)?)?)/\1/p" {{dotenv_filename}})
        venv_python={{venv_home}}/{{project_name}}/$py_ver/bin/python
        [ -f pyproject.toml ] && echo "Project already initialised" || pdm init --python=$venv_python
    else
        echo "Python version not set in {{dotenv_filename}}. Run init-venv-python recipe first"
    fi

# Initialize development packages
[private]
init-dev-pkgs:
    {{pypm_add_dev}} {{lint_tools}} {{test_tools}} {{doc_tools}}

# Set pdm's venv based on the python version in pyproject.toml
set-venv-pyproject:
    #!/bin/sh
    py_ver=$(sed -nE 's/^requires-python = "[~>=]=(3\.[0-9]+)"$/\1/p' pyproject.toml)
    venv_dir={{venv_home}}/{{project_name}}/$py_ver
    pdm use $venv_dir/bin/python
