local M = {}

function M.get_branch_name(current_dir)
    local git_handle = io.popen("git -C " .. current_dir .. " rev-parse --is-inside-work-tree 2>&1")
    local git_result = git_handle:read("*a")
    git_handle:close()

    local hg_handle = io.popen("hg status " .. current_dir .. " 2>&1")
    local hg_result = hg_handle:read("*a")
    hg_handle:close()

    local branch_name = ""

    if git_result:match("true") then
        git_handle = io.popen("git -C " .. current_dir .. " rev-parse --abbrev-ref HEAD 2>&1")
        branch_name = git_handle:read("*a")
        git_handle:close()
    end

    if not hg_result:match("abort: .*") then
        hg_handle = io.popen("cd " .. current_dir .. " && hg branch 2>&1")
        branch_name = hg_handle:read("*a")
        hg_handle:close()
    end

    return branch_name:gsub("\n", "")
end

-----------------

M.cache = {}
M.cache_timeout = 5 -- seconds

function M.get_current_file_branch()
    local current_time = os.time()
    if M.cache.timestamp and current_time - M.cache.timestamp < M.cache_timeout then
        return M.cache.result
    end

    local current_dir = vim.fn.expand("%:p:h") -- current file
    local branch_name = M.get_branch_name(current_dir)

    if branch_name then
        M.cache.result = branch_name
        M.cache.timestamp = current_time
        return M.cache.result
    else
        return nil
    end
end

-----------------

function M.set_cwd_build_dir()
    local current_dir = vim.fn.getcwd()
    local branch_name = "build/" .. M.get_branch_name(current_dir)

    vim.g.cmake_build_dir_location = branch_name
end


return M