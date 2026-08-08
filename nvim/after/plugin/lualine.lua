local wakatime_cache = "Loading..."

local function fetch_wakatime()
   vim.fn.jobstart({"wakatime-cli", "--today"}, {
      stdout_buffered = true,
      on_stdout = function(_, data)
         if data and data[1] and data[1] ~= "" then
            wakatime_cache = data[1]
         else
            wakatime_cache = "Error (fetch)"
         end
      end
   })
end

fetch_wakatime()

local timer = (vim.uv or vim.loop).new_timer()

if timer == nil then
   wakatime_cache = "Error (timer)"
   return
end

timer:start(120000, 120000, vim.schedule_wrap(fetch_wakatime))

local function get_wakatime()
   return wakatime_cache
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {get_wakatime, 'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
