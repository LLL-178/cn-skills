# cn-skills 安装脚本 (Windows PowerShell)
# 用法:
#   .\scripts\install.ps1                                     安装全部技能到 ~/.agents/skills
#   .\scripts\install.ps1 -Target "$HOME\.claude\skills"      安装到指定目录
param(
    [string]$Target = "$env:USERPROFILE\.agents\skills"
)

$SourceDir = Join-Path $PSScriptRoot "..\skills"

if (-not (Test-Path $SourceDir)) {
    Write-Error "未找到技能目录 $SourceDir,请在仓库根目录下运行。"
    exit 1
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null

$count = 0
Get-ChildItem -Directory -Path $SourceDir | ForEach-Object {
    $skillMd = Join-Path $_.FullName "SKILL.md"
    if (Test-Path $skillMd) {
        $dest = Join-Path $Target $_.Name
        if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
        Copy-Item -Recurse -Path $_.FullName -Destination $dest
        Write-Host "已安装: $($_.Name) -> $dest"
        $count++
    }
}

Write-Host ""
Write-Host "完成,共安装 $count 个技能。重启 agent 会话后生效。"
