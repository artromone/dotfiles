vim.g.cmake_command = 'cmake'


local vcs_utils = require("../../../utils/vcs")
vim.api.nvim_create_autocmd("DirChanged", { callback = function() vcs_utils.set_cwd_build_dir() end })


vim.g.cmake_generate_options = {
'-DCMAKE_GENERATOR:STRING=Ninja', 
'-DCMAKE_CXX_COMPILER=/usr/bin/g++', 
'-DCMAKE_PREFIX_PATH:PATH=/opt/qt/Qt5.11.0/5.11.0/gcc_64;',--/opt/qt/Qt6.7.2/6.7.2/gcc_64;/opt/protobuf/static',
}
vim.g.cmake_build_options = { '--', '-j20', }

local git_branch = io.popen('git rev-parse --abbrev-ref HEAD'):read('*all'):gsub('\n', '')
vim.g.cmake_build_dir_location = 'build'

vim.g.cmake_link_compile_commands = 1

-- vim.g.cmake_default_config = 'Debug'
-- vim.g.cmake_native_build_options = {}
-- vim.g.cmake_test_options = {}
-- vim.g.cmake_console_size = 15
-- vim.g.cmake_console_position = 'botright'
-- vim.g.cmake_console_echo_cmd = 1
-- vim.g.cmake_jump = 0
-- vim.g.cmake_jump_on_completion = 0
-- vim.g.cmake_jump_on_error = 1
-- vim.g.cmake_root_markers = {'.git', '.svn'}
-- vim.g.cmake_log_file = ''
-- vim.g.cmake_log_level = 'INFO'
-- vim.g.cmake_statusline = 0
-- vim.g.cmake_restore_state = 1
-- vim.g.cmake_reinit_on_dir_changed = 1

return {
	'cdelledonne/vim-cmake',
}
