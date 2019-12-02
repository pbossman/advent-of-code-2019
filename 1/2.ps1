# Advent-of-code Day 1
# puzzle: 1
# https://adventofcode.com/2019/day/1

function get-fuel {
    param(
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [int] $Mass
    )

    Write-output ([math]::floor($mass / 3) - 2)
}

$input1 = Get-Content -Path ./input1.txt

$result = 0
$result = $input1 | %{
    (get-fuel -Mass $_)    
} | Measure-Object -Sum  | Select-Object -ExpandProperty Sum 

Write-Host -ForegroundColor Yellow "Result: $result"