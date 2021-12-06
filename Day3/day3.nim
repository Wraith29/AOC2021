import strutils

proc getMostCommonBits(values: seq[string]): seq[int] =
    var
        mcb = newSeq[int](0)

    for i in 0 ..< 12:
        var val = 0
        for line in values:
            val += parseInt($line[i])
        mcb.add(val)

    return mcb

proc part1(): int = 
    var
        mcb: seq[int]
        gammaRate: string = "000000000000"
        epsilonRate: string = "000000000000"
        values = readLines("day3/input.txt", 1000)

    mcb = getMostCommonBits(values)

    for i, bit in mcb:
        if bit > int(len(values) / 2):
            gammaRate[i] = '1'
        else:
            epsilonRate[i] = '1'
        
    fromBin[int](gammaRate) * fromBin[int](epsilonRate)

    
proc process(values: seq[string], index: int, lfb: string): string =
    var
        newVals = newSeq[string](0)
        mcb = getMostCommonBits(values)
        bit = mcb[index]
        lfbit: char

    echo mcb
    
    if lfb == "o" and bit >= int(len(values) / 2):
        lfbit = '1'
    elif lfb == "o" and bit < int(len(values) / 2):
        lfbit = '0'
    elif lfb == "c" and bit >= int(len(values) / 2):
        lfbit = '0'
    elif lfb == "c" and bit < int(len(values) / 2):
        lfbit = '1'


    for val in values:
        if val[index] == lfbit:
            newVals.add(val)
    
    if len(newVals) == 1:
        return newVals[0]

    return process(newVals, index + 1, lfb)


proc part2(): int =
    var 
        oxy = process(readLines("day3/input.txt", 1000), 0, "o")
        co2 = process(readLines("day3/input.txt", 1000), 0, "c")

    echo getMostCommonBits(readLines("day3/input.txt", 1000))

    echo "Oxy: ", oxy
    echo "Co2: ", co2

    fromBin[int](oxy) * fromBin[int](co2)

echo "Part 1: ", part1()
echo "Part 2: ", part2()
