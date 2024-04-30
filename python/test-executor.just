# import 'tool/coverage.just'
# import 'tool/pytest.just'
import 'tool/tox.just'

test_tools := 'coverage pytest tox'

# Run type, unit, integration, and documentation tests
test: test-types test-unit test-integration test-docs
