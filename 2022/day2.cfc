component {

    public function Part1( boolean UseSample = false ){

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
                var ThisRoundOutcome = OutcomeValues.Find(input[1]).Find(input[3])
                var MyPlayBonus = PlayValues.Find(input[3])
                return ThisRoundOutcome + MyPlayBonus
            })
            .Sum()

        print.line(GamePlayScore)

    }

    public function Part2( boolean UseSample = false){
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day2_Sample.txt"
            : "./Inputs/Day2.txt"

        var OutcomeValues = {
            "X" : 0,    // Lose
            "Y" : 3,    // Draw
            "Z" : 6     // Win
        }

        var PlayValues = {
            "X" : {         // You need to lose
                "A" : 3,    // Them Rock     // You Scissors
                "B" : 1,    // Them Paper    // You Rock
                "C" : 2     // Them Scissors // You Paper
            }, 
            
            "Y" : {         // You need to draw
                "A" : 1,    // Them Rock     // You Rock
                "B" : 2,    // Them Paper    // You Paper
                "C" : 3     // Them Scissors // You Scissors
            },

            "Z" : {         // You need to win
                "A" : 2,    // Them Rock     // You Paper
                "B" : 3,    // Them Paper    // You Scissors
                "C" : 1     // Them Scissors // You Rock
            }
        }

        var GamePlayScore = FileRead(FilePath)
            .ListToArray(chr(10))
            .Map((input) => {
                var ThisRoundOutcome = OutcomeValues.Find(input[3])
                var MyPlayBonus = PlayValues.Find(input[3]).Find(input[1])
                return ThisRoundOutcome + MyPlayBonus
            })
            .Sum()

        print.line(GamePlayScore)
    }

}