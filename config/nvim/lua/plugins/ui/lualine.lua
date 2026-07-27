---------------------------------------------------------------------------
--- Botton bar config show everytime
---------------------------------------------------------------------------

-- resolve the current abysal palette live (style follows vim.o.background, e.g. gnome_theme_sync)
local function current_colors()
  return require("abysal").colors()
end

-- helper function to create a separator component for lualine
local function separator(icon, color_key)
  return {
    function()
      return icon
    end,
    color = function()
      return { fg = current_colors()[color_key] }
    end,
    padding = { left = 0, right = 0 },
  }
end

-- helper function to determine the appropriate icon for the git branch component
local function resolve_branch_icon()
  local result = vim.fn.systemlist("git rev-parse --abbrev-ref @{upstream} 2>/dev/null")[1]
  return (result and result ~= " ") and " " or "󱓊 "
end

-- function to get the git diff information for the current buffer, showing the number of commits ahead and behind the upstream branch
local git_diff_cache = ""

local function update_git_diff_cache()
  local cwd = vim.fn.getcwd()
  local ahead = tonumber(vim.fn.systemlist("git -C " .. cwd .. " rev-list --count @{upstream}..HEAD 2>/dev/null")[1])
    or 0
  local behind = tonumber(vim.fn.systemlist("git -C " .. cwd .. " rev-list --count HEAD..@{upstream} 2>/dev/null")[1])
    or 0
  local parts = {}
  if ahead > 0 then
    table.insert(parts, "󱖗 " .. ahead)
  end
  if behind > 0 then
    table.insert(parts, "󱖙 " .. behind)
  end
  git_diff_cache = table.concat(parts, " ")
end

local function get_git_diff()
  return git_diff_cache
end

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  callback = update_git_diff_cache,
})

-- get the current git branch name for the current buffer, prefixed with the appropriate icon
local git_branch_cache = ""

local function update_git_branch_cache()
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
  if not branch or branch == "" then
    git_branch_cache = ""
    return
  end
  git_branch_cache = resolve_branch_icon() .. branch
end

local function get_branch_with_icon()
  return git_branch_cache
end

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  callback = function()
    update_git_diff_cache()
    update_git_branch_cache()
  end,
})

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return {
        options = {
          icons_enabled = true,
          theme = "abysal",
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            statusline = { "alpha" },
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = {
            "mode",
            separator("", "bg_elevated"),
          },
          lualine_b = {
            {
              "filename",
              symbols = {
                modified = "󰣕 ",
                readonly = "󰮕 ",
                unnamed = "󰐙 ",
                newfile = "󰐙 ",
              },
            },
            separator("", "bg"),
          },
          lualine_c = {
            {
              get_branch_with_icon,
              color = function()
                return { fg = current_colors().fg }
              end,
            },
            {
              get_git_diff,
              color = function()
                return { fg = current_colors().amber }
              end,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = "󰅚 ", warn = "󱡞 ", info = "󰗖 " },
              -- ponytail: diagnostics_color entries only documented as static
              -- highlight_group_name|table, not function; stays frozen at
              -- startup style until lualine adds function support here
              diagnostics_color = (function()
                local colors = current_colors()
                return {
                  error = { fg = colors.red },
                  warn = { fg = colors.amber },
                  info = { fg = colors.primary },
                }
              end)(),
            },
          },
          lualine_y = {
            separator("", "bg"),
            "filetype",
          },
          lualine_z = {
            separator("", "bg_elevated"),
            "location",
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "fileformat" },
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
