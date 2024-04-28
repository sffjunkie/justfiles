pypm := 'pdm'

python-project-init:
    [ -f pyproject.toml ] && echo "Project already initialised" || {{pypm}} init


python-project-build:
	pdm build
	

pdm-add-dev-pkgs:
	