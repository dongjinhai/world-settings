local wezterm = require 'wezterm'

-- 设置窗口起始位置
-- 1. 找到wezterm的快捷方式，然后打开属性
-- 2. 将目标设置成：D:\WezTerm\wezterm-gui.exe start --position 25%,10%
-- 其中wezterm的安装位置自行确定

local c = {}
if wezterm.config_builder then
    c = wezterm.config_builder()
end

-- 初始大小
c.initial_cols = 120 
c.initial_rows = 40

-- 关闭时不进行确认
c.window_close_confirmation = 'NeverPrompt'

-- 字体
c.font = wezterm.font 'JetBrains Mono'
c.font_size = 14

-- 主题
-- c.color_scheme = "Afterglow"
-- c.color_scheme = "Batman"
-- c.color_scheme = 'Colorful Colors (terminal.sexy)'
-- c.color_scheme = 'Color Star (terminal.sexy)'
-- c.color_scheme = 'darkmoss (base16)'
c.color_scheme = 'Darkside (Gogh)'
-- c.color_scheme = "Catppuccin Mocha" -- or Mocha, Macchiato, Frappe, Latte
-- c.color_scheme = "Catppuccin Macchiato" -- or Mocha, Macchiato, Frappe, Latte
-- c.color_scheme = "Catppuccin Frappe" -- or Mocha, Macchiato, Frappe, Latte
-- c.color_scheme = "Catppuccin Latte" -- or Mocha, Macchiato, Frappe, Latte
-- c.color_scheme = "Gruvbox dark, medium (base16)"
-- c.color_scheme = 'Gruvbox dark, soft (base16)'

c.animation_fps = 60
c.max_fps = 60

c.window_frame = {
    active_titlebar_bg = '#0F2536',
    inactive_titlebar_bg = '#0F2536',
    font = c.font,
    font_size = c.font_size - 3,
}
c.colors = {
    tab_bar = {
        inactive_tab_edge = '#575757'
    }
}
c.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }

-- 设置tab bar
-- c.use_fancy_tab_bar = false
-- c.hide_tab_bar_if_only_one_tab = true
-- c.show_new_tab_button_in_tab_bar = false

-- 透明背景
c.window_background_opacity = 0.97
-- 在neovim编辑的时候也有透明背景
c.text_background_opacity = 0.9
-- 取消 Windows 原生标题栏
c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- 在调整windows大小的时候不改变字体大小
c.adjust_window_size_when_changing_font_size = false

-- 滚动条尺寸为 10 ，其他方向不需要 pad
c.window_padding = { left = 5, right = 10, top = 5, bottom = 0 }
-- 启用滚动条
c.enable_scroll_bar = true

-- 默认shell
c.default_prog = { 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe' }

c.launch_menu = {
    { label = 'PwoerShell', args = { 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe' } },
    { label = 'CMD', args = { 'cmd.exe' } }
}

-- 取消所有默认的热键
c.disable_default_key_bindings = true
local act = wezterm.action
c.keys = {
    -- Ctrl+Shift+L 向后遍历 tab
    { key = 'L', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },
    -- Ctrl+Shift+H 向前遍历 tab
    { key = 'H', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
    -- Ctrl+Shift+C 复制选中区域
    { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    -- Ctrl+Shift+V 粘贴剪切板的内容
    { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    -- Ctrl+Shift+N 新窗口
    { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    -- Ctrl+Shift+T 新 tab
    { key = 'T', mods = 'SHIFT|CTRL', action = act.ShowLauncher },
    -- Ctrl+Shift+Enter 显示启动菜单
    { key = 'Enter', mods = 'SHIFT|CTRL', action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS' } },
    -- Ctrl+Shift+W 关闭 tab 且不进行确认
    { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = false } },
}

return c
