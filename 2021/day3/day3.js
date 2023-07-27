function getData() {
    const fs = require("fs")

    return fs
        .readFileSync("inputs.txt", "utf-8")
        .split("\n")
}

function part1(){
    let gamma = ""
    let epsilon = ""
    
    const data = getData()

    for(i = 0; i < data.at(0).length; i++){

        bitArray = []

        for(j = 0; j < data.length; j++){
            bitArray.push( parseInt( data[j][i] ))
        }

        gamma += bitArray.reduce((a,b) => a + b, 0) >= data.length / 2 ? "1" : "0"
        epsilon += bitArray.reduce((a,b) => a + b, 0) <= data.length / 2 ? "1" : "0"

    }

    return parseInt( gamma, 2) * parseInt( epsilon, 2 )
}

console.log( part1() )