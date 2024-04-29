# import 'tool/coverage.just'
# import 'tool/pytest.just'
import 'tool/tox.just'

test_tools := 'coverage pytest tox'

test: test-unit test-integration test-docs
