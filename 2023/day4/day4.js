function part1() {
    return fs
        .readFileSync("inputs.txt", "utf-8")
        .split("\n")
        .map(item => item.substring(2 + item.indexOf(":"), item.length).trim())
        .map(item => {
            const winningNumbers = item.split("|")[0].split(" ").filter(Boolean);
            const numbersYouHave = item.split("|")[1].split(" ").filter(Boolean);
            const matchingNumbersCount = numbersYouHave.filter(element => winningNumbers.includes(element)).length;

            return parseInt(2 ** (matchingNumbersCount - 1))
        })
        .reduce((total, current) => total + current, 0)
}

const fs = require("fs");
console.log("Part 1 : " + part1());