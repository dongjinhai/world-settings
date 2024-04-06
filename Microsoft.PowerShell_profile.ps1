# 记录脚本开始时间
$StartTime = Get-Date

# 在此处放置你的 PowerShell 脚本代码
# 设置命令行的prompt
function prompt {
    $microsoftLogo = "`e[38;2;9;12;12m`e[48;2;163;174;210m 󰍲 `e[0m"
    $path = "`e[38;2;227;229;229m`e[48;2;118;159;240m $(Get-Location) `e[0m"
    $time = "`e[38;2;160;169;203m`e[48;2;29;34;48m  $(Get-Date -Format 'HH:mm:ss') `e[0m"
    $end = "`e[38;2;29;34;48m`e[0m"
    $cmdPrompt = "`n`e[1;32m>`e[0m"

    "$microsoftLogo$path$time$end$cmdPrompt"
}

# 设置使用tab选择命令候选项
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# 记录脚本结束时间
$EndTime = Get-Date

# 计算脚本执行时间
$ExecutionTime = $EndTime - $StartTime

# 输出执行时间
Write-Host "脚本执行时间： $($ExecutionTime.Hours) 小时, $($ExecutionTime.Minutes) 分钟, $($ExecutionTime.Seconds) 秒, $($ExecutionTime.Milliseconds) 毫秒"
