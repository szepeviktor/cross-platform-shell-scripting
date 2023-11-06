run_test()
{
    TEST_NAME="$1"
    TEST_COMMAND="$(cat "${TEST_NAME}/command")"
    TEST_OUTPUT="$(cat "${TEST_NAME}/output")"
    echo "Testing ${TEST_NAME} ..."
    test "$(eval "${TEST_COMMAND}")" = "${TEST_OUTPUT}"
}

find . -mindepth 1 -maxdepth 1 -type d -not -path "./.*" | while read -r FILE; do
    run_test "${FILE}"
done
