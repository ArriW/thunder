#!/bin/bash

# Define the output HTML file
output_file="Puppy_Training_Guide.html"

# List of Markdown files to include
files=(
  "Comprehensive_Puppy_Training_Guide.md"
  "Nightime Guide"
  "Puppy_Schedule_8-10_Weeks.md"
  "Pomeranian_Puppy_Adoption_Plan.md"
)

# Convert Markdown files to a single HTML file using pandoc with a custom template
pandoc "${files[@]}" -s --template=template.html -o "$output_file"

echo "Compilation complete. The HTML file is saved as $output_file."
