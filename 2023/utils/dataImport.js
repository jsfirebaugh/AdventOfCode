function getData() {
    const fs = require("fs");
    const process = require("process");
    const fileName = process.argv[2] === "test" ? "sample.txt" : "inputs.txt";
    return fs.readFileSync(fileName, "utf-8").split("\n");
}

exports.getData = getData