import 'docs.just'
import 'linter.just'
import 'profiler.just'
import 'project-manager.just'
import 'test-executor.just'
import 'type-checker.just'
import 'virtualenv.just'

default_python_version := '3.11'

venv_home := env_var_or_default("DEVELOPMENT_VENV_HOME", dev_home + "/venv")
python_package := env_var_or_default("PROJECT_PYTHON_PACKAGE", project_name)

docs_src_dir := './src/docs/'
docs_build_dir := './docs/'
tests_dir := './tests/'

test_tools := 'coverage debugpy mypy pyinstrument pytest pytest-cov pytest-custom_exit_code pytest-dotenv python-dotenv[cli] tox'

# Initialize python project with a venv, project manager, pyproject.toml, dev packages and docs
init-devenv: vcs-init init-venv-python init-pyproject init-dev-pkgs init-docs

# Initialize docs
init-docs: sphinx-init-docs

# Build docs
build-docs: sphinx-build-docs

# Test doc building
test-docs: sphinx-test-docs

# Run unit tests
test-unit: pytest-test-unit

# Run integration tests
test-integration: pytest-test-integration

# Generate test coverage metrics
test-coverage: coverage-test-coverage

# Generate test coverage HTML report
test-coverage-html: coverage-test-coverage-html

# Show test coverage in the terminal
test-coverage-term: coverage-test-coverage-term

# Run a python repl
[no-cd]
repl:
    @{{pypm}} run python
