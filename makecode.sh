#!/bin/bash

# Define the output file name
OUTPUT_FILE="complete_project_context.md"

# Clear the output file if it already exists
> "$OUTPUT_FILE"

echo "# Project Source Context" >> "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
echo -e "\n---\n" >> "$OUTPUT_FILE"

# Find .gd and .tscn files, excluding common build/addon folders
find . -type f \( -name "*.gd" -o -name "*.tscn" \) -not -path '*/.*' | while read -r file; do
    
    # Get relative path and extension
    rel_path=$(echo "$file" | sed 's|^\./||')
    extension="${file##*.}"
    
    # Determine syntax highlighting language
    lang="gdscript"
    if [ "$extension" == "tscn" ]; then
        lang="toml"
    fi

    # Append to Markdown
    echo "## File: $rel_path" >> "$OUTPUT_FILE"
    echo '```'$lang >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo -e "\n---\n" >> "$OUTPUT_FILE"
    
    echo "Integrated: $rel_path"
done

echo "Done! Full project context saved to $OUTPUT_FILE"