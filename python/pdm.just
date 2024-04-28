pypm := 'pdm'
pypm_run := 'pdm run'

init-pyproject:
    [ -f pyproject.toml ] && echo "Project already initialised" || {{pypm}} init

project-build:
	pdm build

init-dev-pkgs:
    pdm add -dG dev {{lint_tool}} {{test_tool}} {{docs_tool}}
