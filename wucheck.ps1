$ProcessesToStop = @("psi-bastion", "psi-keygrab")
$CheckInterval = 5

function Stop-PSIProcess {
    param([int]$ProcessId)
    try {
        Stop-Process -Id $ProcessId -Force -ErrorAction SilentlyContinue
        return $true
    } catch {
        try {
            $wmiProc = Get-WmiObject Win32_Process -Filter "ProcessId='$ProcessId'" -ErrorAction SilentlyContinue
            if ($wmiProc) {
                $null = $wmiProc.Terminate()
                return $true
            }
        } catch {}
        return $false
    }
}

function Check-AndStopProcesses {
    foreach ($processName in $ProcessesToStop) {
        $processes = Get-Process -Name $processName -ErrorAction SilentlyContinue
        if ($processes) {
            foreach ($proc in $processes) {
                $null = Stop-PSIProcess -ProcessId $proc.Id
            }
        }
    }
}

try {
    while ($true) {
        Check-AndStopProcesses
        Start-Sleep -Seconds $CheckInterval
    }
} catch {}
