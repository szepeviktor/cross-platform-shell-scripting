run_test()
{
    TEST_NAME="$1"

    echo "Testing ${TEST_NAME} ..."
    TEST_CURRENT="$(. "${TEST_NAME}/command" 2>&1)"
    TEST_OUTPUT="$(cat "${TEST_NAME}/output")"
    echo "DBG: '${TEST_CURRENT}' = '${TEST_OUTPUT}'"
    test "${TEST_CURRENT}" = "${TEST_OUTPUT}"
}

find . -mindepth 1 -maxdepth 1 -type d -not -path "./.*" | while read -r FILE; do
    run_test "${FILE}"
done
