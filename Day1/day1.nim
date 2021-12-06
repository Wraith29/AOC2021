import strutils

proc part1(): int =
    var
        total: int = 0
        l = readLines("day1/input.txt", 2000)
        prevLine: int = parseInt(l[0])

    for line in lines("day1/input.txt"):
        var curLine = parseInt(line)
        if curLine > prevLine:
            inc total
        prevLine = curLine
   
    total

proc part2(): int =
    var
        total: int = 0
        l = readLines("day1/input.txt", 2000)
        prevBlock: int = parseInt(l[0]) + parseInt(l[1]) + parseInt(l[2])

    for i in 0 ..< len(l)-2:
        var curBlock = parseInt(l[i]) + parseInt(l[i+1]) + parseInt(l[i+2])
        if curBlock > prevBlock:
            inc total
        prevBlock = curBlock
    
    total

echo "Part 1: ", part1()
echo "Part 2: ", part2()