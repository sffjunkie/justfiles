# Initialize a virtual environment using the current python version
init-venv-python:
    #!/bin/sh
    venv_dir={{venv_home}}/{{project_name}}
    py_ver=$(python -c 'import sys; print(".".join([str(x) for x in tuple(sys.version_info)[:2]]))')
    [ -d $venv_dir/$py_ver ] && echo "venv already exists in $venv_dir/$py_ver" && exit 0 || :
    mkdir -p $venv_dir
    python -m venv $venv_dir/$py_ver

    grep -q "PYTHON_VERSION=" {{dotenv_filename}}
    if [ $? -eq 0 ]; then
        sed -Ei "s/^PYTHON_VERSION=[0-9]+(\.[0-9]+(\.[0-9]+)?)?/PYTHON_VERSION=$py_ver/" {{dotenv_filename}}
    else
        echo "PYTHON_VERSION=$py_ver" >> {{dotenv_filename}}
    fi
    echo -e "{{color_green}}Initialized venv in $venv_dir/$py_ver{{color_normal}}"

# Initialize a virtual environment using the version defined in pyproject.toml
init-venv-pyproject:
    #!/bin/sh
    venv_dir={{venv_home}}/{{project_name}}
    mkdir -p $venv_dir
    py_ver=$(sed -nE 's/^requires-python = "[~>=]=(3\.[0-9]+)"$/\1/p' pyproject.toml)
    python -m venv $venv_dir/$py_ver
    echo -e "{{color_green}}Initialized venv in $venv_dir/$py_ver{{color_normal}}"

venv-activate:
    #!/bin/sh
    venv_dir={{venv_home}}/{{project_name}}
    grep -q "PYTHON_VERSION=" {{dotenv_filename}}
    if [ $? -eq 0 ]; then
        py_ver=$(sed -nE "s/^PYTHON_VERSION=([0-9]+(\.[0-9]+(\.[0-9]+)?)?)/\1/p" {{dotenv_filename}})
    else
        py_ver=$(find $venv_dir -maxdepth 1 -type d -name 3\* | head -n1)
    fi
    if [ -f $venv_dir/$py_ver/bin/activate ]; then
        echo "Run the following conmmand. It has been copied to the clipboard"
        echo "source $venv_dir/$py_ver/bin/activate" | {{clipboard}}
    else
        echo -e "{{color_red}}Activate script not found in $venv_dir/$py_ver{{color_normal}}"
        exit 1
    fi
