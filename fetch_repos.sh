#!/bin/bash
# === fetch_repos.sh ===
# Clone LoRA / SoRA / DoRA into the current repo

set -e

# target repos
declare -A repos=(
  ["LoRA"]="https://github.com/microsoft/LoRA.git"
  ["SoRA"]="https://github.com/TsinghuaC3I/SoRA.git"
  ["DoRA"]="https://github.com/NVlabs/DoRA.git"
)

echo "Cloning repositories..."

for name in "${!repos[@]}"; do
  url="${repos[$name]}"
  if [ -d "$name" ]; then
    echo "Directory '$name' already exists, skipping..."
  else
    echo "Cloning $name from $url ..."
    git clone --depth=1 "$url" "$name"
    rm -rf "$name/.git"
  fi
done

echo "✅ All repositories fetched into:"
ls -1


