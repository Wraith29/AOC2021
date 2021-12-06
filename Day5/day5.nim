# import std/strformat
import strutils

#! TODO: Fix Solution to output '20898'

type
    Coordinate* = ref object of RootObj
        x1*, x2*, y1*, y2*: int
    
# proc echoCoord(c: Coordinate): string {.inline.} =
#     return &"x1: {c.x1}, x2: {c.x2}, y1: {c.y1}, y2: {c.y2}"

proc solve(): int = 
    var 
        coords = newSeq[Coordinate](0)
        map = newSeq[seq[int]](0)
        tot = 0
    
    for i in 0 ..< 1000:
        map.add(newSeq[int](1000))
            
    for line in readLines("day5/input.txt", 500):
        var
            splitLine = split(line, " -> ")
            c = new(Coordinate)
        
        c.x1 = parseInt(split(splitLine[0], ",")[0])
        c.y1 = parseInt(split(splitLine[0], ",")[1])
        c.x2 = parseInt(split(splitLine[1], ",")[0])
        c.y2 = parseInt(split(splitLine[1], ",")[1])

        coords.add(c)
    
    for c in coords:
        if c.x1 != c.x2 and c.y1 != c.y2: # diagonal
            var 
                diff: int

            if c.x1 > c.x2 and c.y1 > c.y2: # right to left, bottom to top
                diff = c.x1 - c.x2
                for i in 1 .. diff:
                    map[c.y2+i][c.x2+i] += 1

            elif c.x1 > c.x2 and c.y2 > c.y1: # right to left, top to bottom
                diff = c.x1 - c.x2
                for i in 1 .. diff:
                    map[c.y1+i][c.x2+i] += 1 

            elif c.x2 > c.x1 and c.y1 > c.y2: # left to right, bottom to top
                diff = c.x2 - c.x1
                for i in 1 .. diff:
                    map[c.y2+i][c.x1+i] += 1

            elif c.x2 > c.x1 and c.y2 > c.y1: # left to right, top to bottom
                diff = c.x2 - c.x1
                for i in 1 .. diff:
                    map[c.y1+i][c.x1+i] += 1

        elif c.x1 == c.x2: # horizontal
            if c.y1 > c.y2:
                for i in c.y2 .. c.y1:
                    map[i][c.x1] += 1
            else:
                for i in c.y1 .. c.y2:
                    map[i][c.x1] += 1

        elif c.y1 == c.y2: # vertical
            if c.x1 > c.x2:
                for i in c.x2 .. c.x1:
                    map[c.y1][i] += 1 
            else:
                for i in c.x1 .. c.x2:
                    map[c.y1][i] += 1

    for l in map:
        for c in l:
            if c >= 2:
                inc tot
    
    return tot

echo solve()