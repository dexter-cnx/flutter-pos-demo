param (
    [Parameter(Mandatory=$false, Position=0)]
    [string]$Target = "help"
)

$Targets = @{
    "get"          = "flutter pub get"
    "format"       = "dart format ."
    "analyze"      = "flutter analyze"
    "build-runner" = "flutter pub run build_runner build --delete-conflicting-outputs"
    "gen-i18n"     = "dart run scripts/generate_i18n.dart"
    "fix-web"      = "dart run scripts/fix_isar_web_ids.dart"
    "run-web"      = "flutter run -d chrome"
    "run-windows"  = "flutter run -d windows"
    "help"         = "Write-Host 'Available Targets:'; foreach(`$k in `$Targets.Keys) { Write-Host '  - ' `$k }"
}

if ($Targets.ContainsKey($Target)) {
    if ($Target -eq "help") {
        Write-Host "Usage: .\make.ps1 [target]" -ForegroundColor Cyan
        Write-Host "Available Targets:"
        $Targets.Keys | Sort-Object | ForEach-Object { Write-Host "  - $_" }
    } else {
        $Command = $Targets[$Target]
        Write-Host "Executing: $Command" -ForegroundColor Green
        Invoke-Expression $Command
    }
} else {
    Write-Host "Target '$Target' not found." -ForegroundColor Red
    Write-Host "Available Targets: $($Targets.Keys -join ', ')"
}
