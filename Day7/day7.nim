import strutils, sequtils

proc sumOfDiff(x, y: int): int {.inline.} =
    for i in 1 .. (if x > y: x-y else: y-x):
        result += i    

proc part1(): int =
    var 
        crabs = readLines("day7/input.txt", 1)[0]
        fuelCost = newSeq[int](0)
    
    for c in crabs.split(',').map(parseInt):
        var fc = 0
        for cr in crabs.split(',').map(parseInt):
            fc += (if c > cr: c-cr else: cr-c)
        fuelCost.add(fc)
    
    return min(fuelCost)

proc part2(): int =
    var
        crabs = readLines("day7/input.txt", 1)[0]
        crabsNums = crabs.split(',').map(parseInt)
        fuelCost = newSeq[int](0)
    
    for i in min(crabsNums) .. max(crabsNums):
        var fc = 0
        for c in crabs.split(',').map(parseInt):
            fc += sumOfDiff(c, i)
        fuelCost.add(fc)

    return min(fuelCost)

echo "Part 1: ", part1()
echo "Part 2: ", part2()