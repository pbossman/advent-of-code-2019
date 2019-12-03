# Advent-of-code Day 1
# puzzle: 1
# https://adventofcode.com/2019/day/1

function get-fuel {
    [CmdletBinding()]
    param(
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [int] $Mass
    )

    $var = ([math]::floor($mass / 3) - 2)
    Write-Verbose "Value $var"
    if ($var -gt 0) {
        Write-Verbose "Adding $var"
        $var + (get-fuel -Mass $var)
    }
}

$input2 = Get-Content -Path ./input2.txt

$result = 0
$result = $input2 | %{
    (get-fuel -Mass $_)    
} | Measure-Object -Sum  | Select-Object -ExpandProperty Sum 

Write-Host -ForegroundColor Yellow "Result: $result"