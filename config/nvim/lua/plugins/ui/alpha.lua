---------------------------------------------------------------------------
--- Dashboard config show on start
---------------------------------------------------------------------------

return {
  "goolord/alpha-nvim",
  lazy = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },

  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        if vim.fn.argc() > 0 then
          return
        end
        require("alpha").start(false)
      end,
    })
  end,

  config = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      return
    end

    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function hex_to_rgb(hex)
      return { tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16) }
    end

    local function lerp_hex(from, to, t)
      local a, b = hex_to_rgb(from), hex_to_rgb(to)
      return string.format(
        "#%02X%02X%02X",
        math.floor(a[1] + (b[1] - a[1]) * t + 0.5),
        math.floor(a[2] + (b[2] - a[2]) * t + 0.5),
        math.floor(a[3] + (b[3] - a[3]) * t + 0.5)
      )
    end

    local function apply_highlights()
      local c = require("abysal").colors()

      -- Base colors
      vim.api.nvim_set_hl(0, "AlphaLines", { fg = c.fg })
      vim.api.nvim_set_hl(0, "AlphaEyes", { fg = c.primary })
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = c.primary })
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = c.amber })

      -- Gradiand colors
      for i = 1, 5 do
        vim.api.nvim_set_hl(0, "AlphaLogo" .. i, { fg = lerp_hex(c.primary, c.amber, (i - 1) / 4) })
      end
    end

    apply_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_highlights,
    })

    -- header
    -- stylua: ignore start
    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      { type = "text", val = "•─────────────────────────────────⋅☾ ☽⋅─────────────────────────────────•", opts = { hl = "AlphaLines", position = "center" } },
      { type = "text", val = "  ⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⡅⡹⢿⠆⠙⠋⠉⠻⠿⣿⣿⣿⣿⣿⣿⣮⠻⣦⡙⢷⡑⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠡⠌⠂⣙⠻⣛⠻⠷⠐⠈⠛⢱⣮⣷⣽⣿⣿⡏⡏  ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⣿⣿⣿⣿⡇⢿⢹⣿⣶⠐⠁⠀⣀⣠⣤⠄⠀⠀⠈⠙⠻⣿⣿⣿⣦⣵⣌⠻⣷⢝⠦⠚⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣻⣿⣊⡃⠀⣙⠿⣿⣿⣿⣎⢮⡀⢮⣽⣿⣿⣿⡏   ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⢿⣿⣿⣿⣧⡸⡎⡛⡩⠖⠀⣴⣿⣿⣿⠀⠀⠀⠀⠸⠇⠀⠙⢿⣿⣿⣿⣷⣌⢷⣑⢷⣄⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣫⠶⠛⠉⠀⠁⠀⠈⠈⠀⠠⠜⠻⣿⣆⢿⣼⣿⣿⣿⣿⡏   ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⢐⣿⣿⣿⣿⣧⢧⣧⢻⣦⢀⣹⣿⣿⣿⣇⠀⠄⠀⠀⠀⡀⠀⠈⢻⣿⣿⣿⣿⣷⣝⢦⡹⠷⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⠈⠁⠀⠀⠀⠁⠀⠀⠀⠱⣶⣄⡀⠀⠈⠛⠜⣿⣿⣿⣿⣿    ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⠀⠊⢫⣿⣏⣿⡌⣼⣄⢫⡌⣿⣿⣿⣿⣿⣦⡈⠲⣄⣤⣤⡡⢀⣠⣿⣿⣿⣿⣿⣿⣷⣼⣍⢬⣦⡙⣿⣿⣿⣿⣿⣯⢁⡄⠀⡀⡀⠀⠄⢈⣠⢪⠀⣿⣿⣿⣦⠀⢉⢂⠹⡿⣿⣿⡏    ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⠀⠀⠄⢹⢃⢻⣟⠙⣿⣦⠱⢻⣿⣿⣿⣿⣿⣿⣷⣬⣍⣭⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡙⢿⣼⡿⣿⣿⣿⣿⣿⣷⣄⠘⣱⢦⣤⡴⡿⢈⣼⣿⣿⣿⣇⣴⣶⣮⣅⢻⣿⣿⡏    ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⠀⠀⠈⠹⣇⢡⢿⡆⠻⣿⣷⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣍⡻⣿⣟⣻⣿⣿⣿⣿⣷⣦⣥⣬⣤⣴⣾⣿⣿⣿⣿⣷⣿⣿⣿⣿⣷⡜⠃     ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "   ⠀⠀⠀⠀⠀⠀⠛⢷⣜⢷⡌⠻⣿⣿⣦⣝⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣹⣷⣦⣹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠉⠃⠀     ", opts = { hl = "AlphaEyes", position = "center" } },
      { type = "text", val = "•─────────────────────────────────⋅☾ ☽⋅─────────────────────────────────•", opts = { hl = "AlphaLines", position = "center" } },
      { type = "text", val = "       ▄▄▄    ▄▄▄  ▄▄▄▄▄▄▄   ▄▄▄▄▄   ▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄ ▄▄▄      ▄▄▄       ", opts = { hl = "AlphaLogo1", position = "center" } },
      { type = "text", val = "       ████▄  ███ ███▀▀▀▀▀ ▄███████▄ ▀███  ███▀  ███  ████▄  ▄████       ", opts = { hl = "AlphaLogo2", position = "center" } },
      { type = "text", val = "       ███▀██▄███ ███▄▄    ███   ███  ███  ███   ███  ███▀████▀███       ", opts = { hl = "AlphaLogo3", position = "center" } },
      { type = "text", val = "       ███  ▀████ ███      ███▄▄▄███  ███▄▄███   ███  ███  ▀▀  ███       ", opts = { hl = "AlphaLogo4", position = "center" } },
      { type = "text", val = "       ███    ███ ▀███████  ▀█████▀    ▀████▀   ▄███▄ ███      ███       ", opts = { hl = "AlphaLogo5", position = "center" } },
      { type = "padding", val = 1 },
      { type = "text", val = "•─────────────────────────────────⋅☾ ☽⋅─────────────────────────────────•", opts = { hl = "AlphaLines", position = "center" } },
    }
    -- stylua: ignore end

    -- Bottons
    local function btn(key, icon, desc, action)
      local desc_width = 18
      local padded = desc .. string.rep(" ", desc_width - #desc)
      local val = icon .. "  " .. padded .. " ┈┈┈➤ " .. key

      return {
        type = "button",
        val = val,
        on_press = function()
          local k = vim.api.nvim_replace_termcodes(action, true, false, true)
          vim.api.nvim_feedkeys(k, "t", false)
        end,
        opts = {
          position = "center",
          shortcut = "",
          hl = { { "AlphaButtons", 0, #icon + 2 + #padded } },
          hl_shortcut = { { "AlphaShortcut", #icon + 2 + #padded + 3, #val } },
          cursor = 1,
          keymap = { "n", key, action, { noremap = true, silent = true } },
        },
      }
    end

    dashboard.section.buttons.val = {
      btn("y", "    ", "File Explorer", "<cmd>Yazi cwd<cr>"),
      btn("f", "   󰮗 ", "Find File", "<cmd>Telescope find_files<cr>"),
      btn("s", "   󰁯 ", "Restore Session", "<cmd>AutoSession search<cr>"),
      btn("r", "   󰈙 ", "Recent Files", "<cmd>Telescope oldfiles<cr>"),
      btn("q", "   󰈆 ", "Quit", "<cmd>qa<cr>"),
    }

    -- Layout calc to centrer everything
    local function get_padding()
      local total_lines = vim.o.lines
      local content_height = 30
      local padding = math.floor((total_lines - content_height) / 2)
      return math.max(padding, 0)
    end

    -- Layout definition
    dashboard.opts.layout = {
      { type = "padding", val = get_padding },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.opts)
  end,
}
