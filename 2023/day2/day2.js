const fs = require("fs");

function part1() {
    const maxCubes = {
        "red" : 12,
        "green" : 13,
        "blue" : 14
    };
    
    return fs
        .readFileSync("inputs.txt", "utf-8")
        .replaceAll(";", ",")
        .replaceAll(", ", ",")
        .split("\n")
        .map((item) => {
            const gameNumber = parseInt(item.substring(5, item.indexOf(":")));
            const gameResults = item
                .substring(2 + item.indexOf(":"), item.length)
                .split(",");

            for(const reveal of gameResults){
                const color = reveal.substring(1 + reveal.indexOf(" "), reveal.length);
                const cubes = parseInt(reveal.substring(0, reveal.indexOf(" ")));

                if(cubes > maxCubes[color]){
                    return 0;
                }
            }

            return gameNumber;
        })
        .reduce((total, current) => total + current, 0);
}

function part2() {
    return fs
        .readFileSync("inputs.txt", "utf-8")
        .replaceAll(";", ",")
        .replaceAll(", ", ",")
        .split("\n")
        .map(item => item.substring(2 + item.indexOf(":"), item.length))
        .map(item => {
            const gameMinCubes = {
                "red" : 0,
                "blue" : 0,
                "green" : 0
            }

            item
                .split(",")
                .forEach(gamePull => {
                    const color = gamePull.substring(1 + gamePull.indexOf(" "), gamePull.length);
                    const cubes = parseInt(gamePull.substring(0, gamePull.indexOf(" ")));

                    gameMinCubes[color] = Math.max(gameMinCubes[color], cubes)
                });

            return gameMinCubes.red * gameMinCubes.blue * gameMinCubes.green;
        })
        .reduce((current, total) => current + total, 0);
}

console.log("Part 1 : " + part1());
console.log("Part 2 : " + part2());