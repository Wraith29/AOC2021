import strutils

proc part1(): int =
    var
        depth: int = 0
        forward: int = 0
    
    for line in lines("day2/input.txt"):
        var l = split(line, " ", 2)
        case l[0]
        of "forward":
            forward += parseInt(l[1])
        of "up":
            depth -= parseInt(l[1])
        of "down":
            depth += parseInt(l[1])
    
    depth * forward

proc part2(): int =
    var
        aim: int = 0
        hp: int = 0
        depth: int = 0

    for line in lines("day2/input.txt"):
        var l = split(line, " ", 2)
        case l[0]
        of "forward":
            hp += parseInt(l[1])
            depth += aim * parseInt(l[1])
        of "down":
            aim += parseInt(l[1])
        of "up":
            aim -= parseInt(l[1])
        
    depth * hp

echo "Part 1: ", part1()
echo "Part 2: ", part2()
