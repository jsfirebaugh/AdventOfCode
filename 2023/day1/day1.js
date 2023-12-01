function part1() {
    const dataGetter = require("../utils/dataImport")
    const data = dataGetter
        .getData()
        .map(item => item.replace(/\D/g, ""))
        .map(item => parseInt(item[0] + item[item.length - 1]))
        .reduce((total, current) => total + current, 0);

    console.log("Part1: " + data);
}

function part2() {
    const fs = require("fs");

    const data = fs
        .readFileSync("inputs.txt", "utf-8")
        .replaceAll("one", "oonee")
        .replaceAll("two", "ttwoo")
        .replaceAll("three", "tthreee")
        .replaceAll("five", "fivee")
        .replaceAll("seven", "sevenn")
        .replaceAll("eight", "eeightt")
        .replaceAll("nine", "nninee")
        .replaceAll("one", 1)
        .replaceAll("two", 2)
        .replaceAll("three", 3)
        .replaceAll("four", 4)
        .replaceAll("five", 5)
        .replaceAll("six", 6)
        .replaceAll("seven", 7)
        .replaceAll("eight", 8)
        .replaceAll("nine", 9)
        .split("\n")
        .map(item => item.replace(/\D/g, ""))
        .map(item => parseInt(item[0] + item[item.length - 1]))
        .reduce((total, current) => total + current, 0);

    console.log("Part2: " + data);
}

part1();
part2();