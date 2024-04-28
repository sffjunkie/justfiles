# Create the virtual environment
[private]
init-venv-python:
    #!/bin/sh
    py_ver=$(sed -nE 's/^requires-python = "[~>=]=(3\.[0-9]+)"$/\1/p' pyproject.toml)
    venv_dir={{dev_home}}/venv/{{project_name}}/ $py_ver
    mkdir -p $venv_dir
    cd $venv_dir
    python -m venv $py_ver
