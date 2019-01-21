#!/usr/bin/env bash

# Resolve absolute paths.
CURRENT_DIR=$(cd $(dirname "$0"); pwd)
SOURCE_DIR=$(cd "$CURRENT_DIR/.."; pwd)

INPUT_FILES=(
    "promise-polyfill.js"
    "typedarray.js"
    "error-polyfill.js"
)

OUTPUT_FILE="$SOURCE_DIR/LiquidCore/node-8.9.3/V82JSC/polyfill/polyfill.c"

cd "$SOURCE_DIR/LiquidCore/node-8.9.3/V82JSC/polyfill"
printf "/* Autogenerated.  Do not edit. */\n" > "$OUTPUT_FILE"
for INFILE in "${INPUT_FILES[@]}";
do
   xxd -i "$INFILE" >> "$OUTPUT_FILE"
   printf "\n/*-------*/\n" >> "$OUTPUT_FILE"
done

echo "Generated javascript polyfill: $OUTPUT_FILE";