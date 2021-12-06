import strutils, tables

proc getFish(): seq[int] {.inline.} =
    var
        af = readLines("day6/input.txt", 1)
        nf = newSeq[int](0)
    
    for f in split(af[0], ','):
        nf.add(parseInt($f))
    return nf
    
proc sumMap(map: Table): int {.inline.} =
    return map["0"] + map["1"] + map["2"] + map["3"] + map["4"] + map["5"] + map["6"] + map["7"] + map["8"]

proc part1(): int =
    var f = getFish()

    for day in 0 ..< 80:
        for index in 0 ..< f.len:
            case f[index]:
                of 0:
                    f.add(8)
                    f[index] = 6
                of 1 .. 8:
                    dec f[index]
                else:
                    echo "Invalid"

    return f.len

proc part2(): int =
    var 
        f = getFish()
        fMap = {
            "0": 0, "1": 0, "2": 0, "3": 0,
            "4": 0, "5": 0, "6": 0, "7": 0, "8": 0
        }.toTable()

    for fish in f:
        fMap[$fish] += 1
    
    for day in 0 ..< 256:
        var tempMap = deepCopy(fMap)
        fMap["0"] = tempMap["1"]
        fMap["1"] = tempMap["2"]
        fMap["2"] = tempMap["3"]
        fMap["3"] = tempMap["4"]
        fMap["4"] = tempMap["5"]
        fMap["5"] = tempMap["6"]
        fMap["6"] = tempMap["7"] + tempMap["0"]
        fMap["7"] = tempMap["8"]
        fMap["8"] = tempMap["0"]

    return sumMap(fMap)    


echo "Part1: ", part1()
echo "Part2: ", part2()