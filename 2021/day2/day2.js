function getData() {
    const fs = require("fs")

    return fs
        .readFileSync("inputs.txt", "utf-8")
        .split("\n")
        .map(input => { 
            return { 
                direction : input.split(" ").at(0), 
                amount : parseInt(input.split(" ").at(1))
            }
        })
}

function part1() {
    let depth = 0
    let horizontal = 0

    getData().forEach(input => {
        switch(input.direction){
            case "forward" :
                horizontal += input.amount
                break
            case "up" : 
                depth -= input.amount
                break
            case "down" : 
                depth += input.amount
                break
        }
    })

    return horizontal * depth
}

function part2() {
    let aim = 0
    let depth = 0
    let horizontal = 0

    getData().forEach(input => {
        switch(input.direction){
            case "forward" :
                horizontal += input.amount
                depth = depth + ( aim * input.amount )
                break
            case "up" : 
                aim -= input.amount
                break
            case "down" : 
                aim += input.amount
                break
        }
    })

    return horizontal * depth
}

console.log(part1())
console.log(part2())