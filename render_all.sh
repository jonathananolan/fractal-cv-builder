#!/bin/bash

# Render all CV theme variants.
#
# Content lives in a single cv.yaml at the root.
# Each cv_* folder has a design.yaml (theme settings) and the theme template.
# This script merges them, renders, extracts PDF/PNG, and cleans up.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CV_CONTENT="$SCRIPT_DIR/cv.yaml"

if [ ! -f "$CV_CONTENT" ]; then
    echo "Error: cv.yaml not found in $SCRIPT_DIR"
    exit 1
fi

echo "Rendering all CV variants..."
echo "=============================="

for cv_dir in "$SCRIPT_DIR"/cv_*/; do
    dir_name=$(basename "$cv_dir")

    if [ ! -f "$cv_dir/design.yaml" ]; then
        echo "Skipping $dir_name (no design.yaml)"
        continue
    fi

    echo ""
    echo "Rendering: $dir_name"
    echo "----------------------------"

    # Merge cv.yaml + design.yaml into a temp file inside the theme folder
    cat "$CV_CONTENT" "$cv_dir/design.yaml" > "$cv_dir/cv.yaml"

    # Render from inside the theme folder (so rendercv finds the theme)
    (cd "$cv_dir" && rendercv render cv.yaml)

    # Extract PDF and PNG from rendercv_output
    if [ -d "$cv_dir/rendercv_output" ]; then
        pdf=$(find "$cv_dir/rendercv_output" -name "*.pdf" -type f | head -1)
        if [ -n "$pdf" ]; then
            cp "$pdf" "$cv_dir/${dir_name}.pdf"
            echo "  -> ${dir_name}/${dir_name}.pdf"
        fi

        for png in "$cv_dir"/rendercv_output/*_1.png; do
            if [ -f "$png" ]; then
                cp "$png" "$cv_dir/${dir_name}.png"
                echo "  -> ${dir_name}/${dir_name}.png"
            fi
        done

        # Clean up temp output
        python3 -c "import shutil; shutil.rmtree('$cv_dir/rendercv_output')"
    fi

    # Clean up generated cv.yaml and __pycache__
    rm "$cv_dir/cv.yaml"
    python3 -c "
import shutil, glob
for d in glob.glob('$cv_dir/*/__pycache__'):
    shutil.rmtree(d)
" 2>/dev/null || true

done

echo ""
echo "=============================="
echo "All CVs rendered!"
echo ""
echo "PDFs:"
for f in "$SCRIPT_DIR"/cv_*/*.pdf; do
    [ -f "$f" ] && echo "  $(basename "$(dirname "$f")")/$(basename "$f")"
done
