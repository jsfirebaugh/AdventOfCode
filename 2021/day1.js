function part1() {
    const fs = require("fs")
    const data = fs
        .readFileSync("inputs.txt", "utf8")
        .split("\n")
        .map(Number)

    let increaseCounter = 0

    for(i = 1; i <= data.length; i++){
        if(data[i] > data[i-1]){
            increaseCounter = increaseCounter + 1
        }
    }

    return increaseCounter
}

function part1_2() {
    const fs = require("fs")
    return fs
        .readFileSync("inputs.txt", "utf8")
        .split("\n")
        .map(Number)
        .filter((value, index, origArray) => {
            return index > 0 && value > origArray[index - 1]
        })
        .length
}

function part2() {
    const fs = require("fs")
    const data = fs
        .readFileSync("inputs.txt", "utf8")
        .split("\n")
        .map(Number)

    let increaseCounter = 0

    for(i = 3; i <= data.length; i++){
        const window1 = data[i] + data[i-1] + data[i-2]
        const window2 = data[i-1] + data[i-2] + data[i-3]
        
        if( window1 > window2){
            increaseCounter = increaseCounter + 1
        }
    }

    return increaseCounter
}

function part2_2() {
    const fs = require("fs")
    const data = fs
        .readFileSync("inputs.txt", "utf8")
        .split("\n")
        .map(Number)
        .filter((value, index, origArray) => {
            return index > 2 && (origArray[index] + origArray[index-1] + origArray[index-2]) > (origArray[index-1] + origArray[index-2] + origArray[index-3])
        })
        .length

    return data
}

console.log(part1())
console.log(part1_2())
console.log("------------------")
console.log(part2())
console.log(part2_2())