
$range = 153517..630395

$out = $range | ? {([string]$_).Length -eq 6} | ? {
        $curr = $_
    $count = 0
    $list =  ([string]$_)[0..$([string]$_).length]
    $sort = $list | sort
    0..($list.length-1) | %{ if ($list[$_] -eq $sort[$_]){ $count++ } }
    If ($count -eq $list.Count) {
        $curr
    }
} | ? {
    $curr = $_
    IF (([string]$_)[0..$([string]$_).length] | Group-Object | ? Count -ge 2) {
        $curr
    }
} 

Write-Host -ForegroundColor Green "$($out.Count) possible Passwords"