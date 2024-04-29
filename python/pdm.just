pypm := 'pdm'
pypm_run := 'pdm run'
pypm_add := 'pdm add'
pypm_add_dev := 'pdm add -dG dev'

# Build the project
build:
	pdm build

# Create a pyproject.toml 
[private]
init-pyproject:
    #!/bin/sh
    if grep -q "PYTHON_VERSION=" .project; then
        py_ver=$(sed -nE "s/^PYTHON_VERSION=([0-9]+(\.[0-9]+(\.[0-9]+)?)?)/\1/p" .project)
        venv_python={{venv_home}}/{{project_name}}/$py_ver/bin/python
        @[ -f pyproject.toml ] && echo "Project already initialised" || pdm init --python=$venv_python
    else
        echo "Python version not set in .project. Run init-venv-python recipe first"
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
