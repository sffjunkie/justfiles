import 'docs.just'
import 'linter.just'
import 'project-manager.just'
import 'test-executor.just'
import 'type-checker.just'
import 'virtualenv.just'

default_python_version := '3.11'

venv_home := env_var_or_default("DEVELOPMENT_VENV_HOME", dev_home + "/venv")

pkg_src_dir := './src/' + project_name + '/'
docs_src_dir := './src/docs/'
docs_build_dir := './docs/'
tests_dir := './tests/'

test_tools := 'coverage mypy pytest pytest-cov pytest-custom_exit_code pytest-dotenv tox'

# Initialize docs
init-docs: sphinx-init-docs

# Build docs
build-docs: sphinx-build-docs

# Test doc building
test-docs: sphinx-test-docs

# Initialize python project with a venv, project manager, pyproject.toml, dev packages and docs
init-project: init-venv-python init-pyproject init-dev-pkgs init-docs

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
