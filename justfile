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
