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
