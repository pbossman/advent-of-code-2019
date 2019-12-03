$filepath = ".\Day2-input.txt"
#$data = Get-Content $filepath 
$data = "1,1,1,4,99,5,6,0,99"
$opcodemarker = $opcodeindex + 4
$array = $data -split ','

$opcodeindex = 0
While ($array[$opcodeindex] -in @(1,2)) {
    $outposition = $array[($opcodeindex+3)]

    switch ($array[$opcodeindex]) {

        1 { $array[$outposition] = [int]$array[$array[($opcodeindex+1)]] + [int]$array[$array[($opcodeindex+2)]] }
        2 { $array[$outposition] = [int]$array[$array[($opcodeindex+1)]] * [int]$array[$array[($opcodeindex+2)]] }
        99 { break }
    }
    $opcodeindex = $opcodeindex + 4
}

$array -join '-'
Write-host -ForegroundColor Yellow $array[0]
