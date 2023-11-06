run_test()
{
    TEST_NAME="$1"

    echo "Testing ${TEST_NAME} ..."
    echo "DBG: $(. "${TEST_NAME}/command") = $(cat "${TEST_NAME}/output")"
    test "$(. "${TEST_NAME}/command" 2>&1)" = "$(cat "${TEST_NAME}/output")"
}

find . -mindepth 1 -maxdepth 1 -type d -not -path "./.*" | while read -r FILE; do
    run_test "${FILE}"
done
