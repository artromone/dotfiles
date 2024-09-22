#!/bin/bash

replace_symbols() {
    replaced_name=$(echo "$1" | sed 's/[^a-zA-Z0-9\/]/_/g' | tr '/' '-')
    echo "$replaced_name"
}

insert_to_plugins_lua() {
    local filename="$1"
    local file="lua/plugins/plugins.lua"
    sed -i "2i\        '${filename}'," $file
    echo "File name '${filename}' added to lua/plugins/plugins.lua"
}

create_lua_file() {
    local plugin_name="$1"
    local directory="$2"
    local replaced_name=$(replace_symbols "$plugin_name")
    local file_path="lua/plugins/configs/${directory}/${replaced_name}.lua"
    mkdir -p "$(dirname "$file_path")"
    cat << EOF > "$file_path"
local function config()
end

local function opts()
end

return {
    "$plugin_name",
    -- event = "",
    -- dependencies = {},
    config = config,
    opts = opts
}
EOF
    echo "File $file_path successfully created."
    insert_to_plugins_lua "${directory}/${replaced_name}.lua" "$directory"
}

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 plugin_name directory_name"
else
    create_lua_file "$1" "$2"
fi
