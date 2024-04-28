pypm := 'pdm'
pypm_run := 'pdm run'
pypm_add := 'pdm add'
pypm_add_dev := 'pdm add -dG dev'

# Create a pyproject.toml
init-pyproject:
    @[ -f pyproject.toml ] && echo "Project already initialised" || {{pypm}} init

# Build the project
build:
	pdm build

# Initialize development packages
init-dev-pkgs:
    {{pypm_add_dev}} {{lint_tools}} {{test_tools}} {{doc_tools}}

# Set the virtual environment to use
init-venv-use:
    #!/bin/sh
    py_ver=$(python -c 'import sys; print(".".join([str(x) for x in tuple(sys.version_info)[:2]]))')
    pdm use {{dev_home}}/venv/{{project_name}}/$py_ver/bin/python
