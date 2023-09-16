component {

    public function part1( boolean UseSample = false ){

        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day2_Sample.txt"
            : "./Inputs/Day2.txt"

        var PlayValues = {
            "X" = 1,
            "Y" = 2,
            "Z" = 3
        }

        var OutcomeValues = {
            "A" : {
                "X" : 3,
                "Y" : 6,
                "Z" : 0
            },

            "B" : {
                "X" : 0,
                "Y" : 3,
                "Z" : 6
            },

            "C" : {
                "X" : 6,
                "Y" : 0,
                "Z" : 3
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