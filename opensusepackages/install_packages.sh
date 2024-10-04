#!/bin/bash

FILE="unique_packages.txt"

if [[ ! -f "$FILE" ]]; then
    echo "No file $FILE!"
    exit 1
fi

while read -r package; do
    echo "- Installing: $package"
    sudo zypper install -y "$package"
done < "$FILE"

echo "Installation complete!"
