#!/bin/bash

# Define the output HTML file
output_file="Puppy_Training_Guide.html"

# List of Markdown files to include
files=(
  "guides/comprehensive-guide.md"
  "guides/nighttime-guide.md"
  "guides/puppy-schedule.md"
  "guides/adoption-plan.md"
)

# Convert Markdown files to a single HTML file using pandoc with a custom template
pandoc "${files[@]}" -s --template=tools/template.html -o "$output_file"

echo "Compilation complete. The HTML file is saved as $output_file."
