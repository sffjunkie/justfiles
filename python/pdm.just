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
    @[ -f pyproject.toml ] && echo "Project already initialised" || {{pypm}} init

# Initialize development packages
[private]
init-dev-pkgs:
    {{pypm_add_dev}} {{lint_tools}} {{test_tools}} {{doc_tools}}

# Set the virtual environment to use
[private]
init-venv-use:
    #!/bin/sh
    py_ver=$(py_ver=$(sed -nE 's/^requires-python = "[~>=]=(3\.[0-9]+)"$/\1/p' pyproject.toml))
    pdm use {{dev_home}}/venv/{{project_name}}/$py_ver/bin/python
