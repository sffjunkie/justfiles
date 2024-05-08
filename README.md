# justfiles -  A collection of Justfiles for development tasks

A set of [Justfiles](https://github.com/casey/just) for my development tasks.

Currently only targets Python projects.

There are 2 main Justfiles

1. `Justfile.init`
   - Initializes a new project with the `init` recipe
     - Can be run from any directory.
     - Retrieves the main Justfiles from Github.
2. `Justfile`
   - The main entry point for project management
   - Includes the other Justfiles.
   - Linked from `Justfile.main` in the `just` directory

Download [Justfile.init](https://raw.githubusercontent.com/sffjunkie/justfiles/main/Justfile.init) and run

```sh
just --justfile=Justfile.init init project <project-name>
```

to create a project `<project-name>` under `$HOME/development/project`.

Then `cd` to `$HOME/development/project/<project-name>` and run

```sh
just init-devenv
```

## Development Layout

Development related files are stored in `$HOME/development` with the folowing structure

```text
<project-stage>
    <project-name>
venv
    <project-name>
        <python-version>
```

## Project layout

The current project layout is as follows

```text
pyproject.toml
src
    <project name>
    docs - Source files for the documentation
tests
docs - Built documentation
```

## `Justfile.init`

Use the following to create a new project

```sh
just -f <path to Justfile.init> init project <project-name> <project-language>
```

or

```sh
just -f <path to Justfile.init> init bluesky <project-name> <project-language>
```

Currently the only language is 'python'.

## `Justfile.main`

Main recipes for project management. Linked to `Justfile`

Running `just` will display a list of the recipes.

### Justfile

`just-update` - Updates the local Justfiles from Github

`just-develop` - Switch to the `develop` branch

`just-main` - Switch to the `main` branch

### Python

#### Python Recipes

`add` - Add distributions to the project

`add-dev` - Add distributions for development tasks

`build` - Uses `pdm` to build the distribution files

`build-docs` - Builds the documentation using Sphinx

`init-pre-commit` - Initialize pre-commit tool

`init-devenv` - Initializes a new project using `pdm`,
adds the required development packages
and creates a set of documentation files.
Works by running the following recipes `init-pyproject`, `init-dev-pkgs`, and `init-docs`

`init-venv-pyproject` - Intializes a virtual environment using the version of python defined in
`pyproject.toml`.

`init-venv-python` - Intializes a virtual environment using the current version of python.

`lint` - Runs the `ruff` linter

`profile-module` - Runs the module with `pyinstrument`

`profile-script` - Runs a script with `pyinstrument`

`python-info` - Displays information about the python being used.

`repl` - Opens a Python REPL

`run` - Runs a Python one-liner

`run-module` - Runs the project's module

`set-venv-pyproject` - Set pdm's venv based on the python version in `pyproject.toml`

`test` - Uses `tox` to run the unit and integration tests

`test-coverage` - Generates test coverage metrics

`test-coverage-html` - Creates the test coverage report in HTML and opens it in a browser.

`test-coverage-term` - Creates the test coverage report and displays it in the terminal.

`test-docs` - Uses tox to test the documentation generation

`test-integration` - Runs integration tests using `pytest`

`test-types` - Uses `mypy` to perform type checking

`test-unit` - Runs unit tests using `pytest`

#### Python Tools

For Python projects I'm currently using the following tools

- pdm - [Github](https://github.com/pdm-project/pdm), [docs](https://pdm-project.org/en/latest/)
- pytest - [Github](https://github.com/pytest-dev/pytest), [docs](https://docs.pytest.org/)
- pytest-dotenv - [Github](https://github.com/theskumar/python-dotenv)
- ruff - [Github](https://github.com/astral-sh/ruff), [docs](https://docs.astral.sh/ruff/)
- mypy - [Github](https://github.com/python/mypy), [docs](https://mypy.readthedocs.io/en/stable/)
- sphinx - [Github](https://github.com/sphinx-doc/sphinx), [docs](https://www.sphinx-doc.org/en/master/)
- pre-commit - [Github](https://github.com/pre-commit/pre-commit), [docs](https://pre-commit.com/)
- pyinstrument - [Github](https://github.com/joerick/pyinstrument), [docs](https://pyinstrument.readthedocs.io/en/latest/home.html)
