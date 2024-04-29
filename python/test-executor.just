# import 'tool/coverage.just'
# import 'tool/pytest.just'
import 'tool/tox.just'

test_tools := 'coverage pytest tox'

# Run unit tests, integration tests and documentation tests
test: test-unit test-integration test-docs
