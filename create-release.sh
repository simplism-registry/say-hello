#!/bin/bash
set -o allexport; source .release.env; set +o allexport
echo "📦 create release: $TAG $MESSAGE"

cargo clean
cargo build --release --target wasm32-wasi

find . -name '.DS_Store' -type f -delete

git add .
git commit -m "📦 ${MESSAGE}"

git tag -a ${TAG} -m "${MESSAGE}"
git push origin ${TAG}

gh release create ${TAG} ${WASM_PATH}/${WASM_FILE} --title "${TITLE}" --notes "${MESSAGE}"
