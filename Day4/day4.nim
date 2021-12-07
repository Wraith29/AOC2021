import strutils
# this does not work
proc part1(): int = 
    var
        allLines = readLines("day4/input.txt", 601)
        numbers = allLines[0]
        allBoards = deepCopy(allLines)
        called = newSeq[int](0)
    
    allBoards.delete(0)
    allBoards.delete(0)

    for num in split(numbers, ","):
        called.add(parseInt(num))

        for line in allBoards:

            var allContained = true

            block rowLoop:
                for col in split(line, " "):
                    if col == "":
                        break rowLoop
                    if not contains(called, parseInt(col)):
                        allContained = false
                        break rowLoop
            
                if allContained:
                    echo called
                    echo line
                    var tot = 0
                    for col in split(line, " "):
                        tot += parseInt(col)
                    
                    return 0


echo part1()