# Run as
# > powershell -ExecutionPolicy ByPass -File Watch-Mem.ps1

# Always keep 1G free memory
$MIN = 1
$LOG = "$Env:USERPROFILE\Desktop\Watch-Mem.log"

Function Watch-Mem {
    While ($TRUE) {
        $now = Get-Date -Format "yyyy-MM-dd HH.mm.ss"
        $os = Get-WmiObject Win32_OperatingSystem
        $free_mem_gb = [Math]::Round($os.FreePhysicalMemory / 1024 / 1024, 2)
        $free_mem_mb = [Math]::Round($os.FreePhysicalMemory / 1024, 2)
        $cpu_util = (Get-WmiObject Win32_Processor | Measure-Object LoadPercentage -Average | Select-Object Average).Average

        $msg = "{0, 5:N2} GB free mem, {1, 3} % CPU util, at {2}" -f $free_mem_gb, $cpu_util, $now
        If ($free_mem_gb -lt $MIN) {
            # kill the process occupies most memory
            $bad_luck_ps = Get-Process | Sort-Object WS | Select-Object -Last 1
            $msg = "kill {0} at {1}" -f $bad_luck_ps.ProcessName, $now
            Stop-Process $bad_luck_ps.Id
        }
        EchoAndLog $LOG $msg
        Start-Sleep -Seconds 1
    }
}

Function EchoAndLog {
    Param ([string]$file, [string]$msg)
    Write-Output $msg
    Add-Content $file $msg
}

Watch-Mem
