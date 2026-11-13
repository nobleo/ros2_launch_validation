AUTOWARE_TAG := "0.51.0"
AUTOWARE_REPO := "https://github.com/autowarefoundation/autoware_universe.git"

verify:
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s globstar

    tmpdir="$(mktemp -d)"
    trap 'rm -rf "$tmpdir"' EXIT
    cloned="$tmpdir/autoware_universe"

    git clone --depth 1 --branch "{{AUTOWARE_TAG}}" "{{AUTOWARE_REPO}}" "$cloned"

    launch_files=("$cloned"/**/*.launch.xml)
    echo "Validating ${#launch_files[@]} launch files against ros2_launch.xsd"
    xmllint --noout --schema <(cat ros2_launch.xsd) "${launch_files[@]}"

    echo "Validation complete"

# Files in tests/valid must validate; each file in tests/invalid must be rejected
test:
    #!/usr/bin/env bash
    set -uo pipefail
    failed=0
    if ! xmllint --noout --schema ros2_launch.xsd "tests/valid.launch.xml"; then
        echo "FAIL (should be valid): tests/valid.launch.xml"; failed=1
    fi
    for f in tests/invalid/*.launch.xml; do
        if xmllint --noout --schema ros2_launch.xsd "$f" 2>/dev/null; then
            echo "FAIL (should be invalid): $f"; failed=1
        else
            echo "$f rejected (ok)"
        fi
    done
    exit $failed
