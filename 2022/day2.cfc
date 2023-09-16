component {

    public function part1( boolean UseSample = false ){

        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day2_Sample.txt"
            : "./Inputs/Day2.txt"

        var PlayValues = {
            "X" = 1, // Rock
            "Y" = 2, // Paper
            "Z" = 3  // Scissors
        }

        var OutcomeValues = {
            "A" : {             // They Play Rock
                "X" : 3,        // You Play Rock        -- Tie
                "Y" : 6,        // You Play Paper       -- Win
                "Z" : 0         // You Play Scissors    -- Lose
            },

            "B" : {             // They Play Paper
                "X" : 0,        // You Play Rock        -- Lose
                "Y" : 3,        // You Play Paper       -- Tie
                "Z" : 6         // You Play Scissors    -- Win
            },

            "C" : {             // They Play Scissors
                "X" : 6,        // You Play Rock        -- Win
                "Y" : 0,        // You Play Paper       -- Lose
                "Z" : 3         // You Play Scissors    -- Tie
            }
        }

        var GamePlayScore = FileRead(FilePath)
            .ListToArray(chr(10))
            .Map((input) => {
                var ThisRoundOutcome = OutcomeValues.find(input[1]).find(input[3])
                var MyPlayBonus = PlayValues.find(input[3])
                return ThisRoundOutcome + MyPlayBonus
            })
            .sum()

        print.line(GamePlayScore)

    }

}