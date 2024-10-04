#!/bin/bash
zypper packages --userinstalled | awk -F '|' '{print $3}' | sed 's/^[ \t]*//;s/[ \t]*$//' | sort -u > unique_packages.txt
echo "unique_packages.txt"
