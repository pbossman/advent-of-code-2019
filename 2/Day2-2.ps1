function get-result {
    param (
        # opcode
        [Parameter(Mandatory=$true)]
        [string]
        $opcode,
        # Noun - pos 1
        [Parameter(Mandatory=$true)]
        [int]
        $Noun,
        # Verb - pos 2
        [Parameter(Mandatory=$true)]
        [int]
        $verb
    )
    
    $array = $opcode -split ','
    $array[1] = $Noun
    $array[2] = $verb
    
    $opcodeindex = 0

    While ($array[$opcodeindex] -in @(1,2)) {
        $outposition = $array[($opcodeindex+3)]
    
        switch ($array[$opcodeindex]) {
    
            1 { $array[$outposition] = [int]$array[$array[($opcodeindex+1)]] + [int]$array[$array[($opcodeindex+2)]] 
                $opcodeindex = $opcodeindex + 4
                }
            2 { $array[$outposition] = [int]$array[$array[($opcodeindex+1)]] * [int]$array[$array[($opcodeindex+2)]] 
                $opcodeindex = $opcodeindex + 4
            }
            99 { break,
                $opcodeindex = $opcodeindex + 1
            }
        }
    }
    $array[0]    
}

$output = 0..99 | ForEach-Object { 
    $n = $_
    0..99 | ForEach-Object { 
        $v = $_
        get-result -opcode $contents -Noun $n -verb $v
    } | Select @{n='Out';Expression={$_}},
        @{n='Noun';Expression={$n}},
        @{n='Verb';Expression={$v}}
} 

# find Noun/Verb pair that output 19690720
$NounVerbPair = $output | ? out -eq 19690720

$finalResult = $NounVerbPair.noun * 100 + $NounVerbPair.Verb
 
Write-Host -ForegroundColor Green "FinalResult => $finalResult"