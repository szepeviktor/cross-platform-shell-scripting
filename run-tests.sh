# shellcheck shell=sh

run_test()
{
    TEST_NAME="$1"

    echo
    echo "Testing ${TEST_NAME} ..."
    test -r "${TEST_NAME}/command"
    test -r "${TEST_NAME}/output"
    # shellcheck disable=SC1091
    TEST_CURRENT="$(. "${TEST_NAME}/command" 2>&1)"
    TEST_EXPECTED="$(cat "${TEST_NAME}/output")"
    echo "DBG: '${TEST_CURRENT}' = '${TEST_EXPECTED}'"
    test "${TEST_CURRENT}" = "${TEST_EXPECTED}"
}

find . -mindepth 1 -maxdepth 1 -type d -not -path "./.*" | while read -r FILE; do
    run_test "${FILE}"
done
