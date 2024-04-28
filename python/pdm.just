pypm := 'pdm'
pypm_run := 'pdm run'

# Create a pyproject.toml
init-pyproject:
    [ -f pyproject.toml ] && echo "Project already initialised" || {{pypm}} init

# Build the project
build-project:
	pdm build

# Initialize development packages
[private]
init-dev-pkgs:
    pdm add -dG dev {{lint_tool}} {{test_tool}} {{docs_tool}}
