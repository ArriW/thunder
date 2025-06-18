#!/usr/bin/env bash
# Compress images in images/ directory, writing optimized files in-place or to a ./images/compressed folder.

set -euo pipefail

SRC_DIR="$(dirname "$0")/../images"
OUT_DIR="$SRC_DIR/compressed"
mkdir -p "$OUT_DIR"
export OUT_DIR

compress_jpg() {
  local input="$1"; local filename="$(basename "$input")"
  if command -v mogrify >/dev/null 2>&1; then
    # Compress to 80% quality JPEG, strip metadata and use progressive encoding
    echo "Compressing JPEG $filename"
    # Copy original to output then compress in-place there
    cp "$input" "$OUT_DIR/$filename"
    mogrify -strip -interlace Plane -quality 80 "$OUT_DIR/$filename"
  else
    echo "🛈 Skipping JPEG compression for $filename (ImageMagick mogrify not found)" >&2
  fi
}

compress_png() {
  local input="$1"; local filename="$(basename "$input")"
  if command -v pngquant >/dev/null 2>&1; then
    echo "Compressing PNG $filename"
    pngquant --quality=65-80 --output "$OUT_DIR/$filename" --force "$input"
  else
    echo "🛈 Skipping PNG compression for $filename (pngquant not found)" >&2
    # Fallback: just copy file
    cp "$input" "$OUT_DIR/$filename"
  fi
}

export -f compress_jpg compress_png

find "$SRC_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec bash -c 'compress_jpg "$0"' {} \;
find "$SRC_DIR" -maxdepth 1 -type f -iname "*.png" -exec bash -c 'compress_png "$0"' {} \;

echo "✅ Image compression finished. Output in $OUT_DIR"