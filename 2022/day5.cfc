component {

    public function part1( boolean UseSample = false ){
        
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day5_Sample.txt"
            : "./Inputs/Day5.txt"

        var Inputs = FileRead( FilePath )
            .ListToArray(
                delimiter = "#chr(10)##chr(10)#", 
                includeEmptyFields = true,
                multiCharacterDelimiter = true
            )

        var Moves = Inputs[2]
            .ListToArray(chr(10))
            .Map((item) => {
                var MoveArray = item.ListToArray(" ")

                return {
                    "from" : MoveArray[4],
                    "to" : MoveArray[6],
                    "howMany" : MoveArray[2]
                }
            })

        var Stacks = Inputs[1].ListToArray(chr(10))

        var ItemPositionsStruct = {}

        var ItemPositions = Stacks.pop()
            .ListToArray("")
            .Each((input,index) => {
                if(IsNumeric(input)){
                    ItemPositionsStruct.Append(
                        { 
                            "stack_#input#" : index 
                        }
                    )
                }
            })

        var PivotArray = []

        for(var i = 1; i <= itemPositionsStruct.Count(); i++){
            var ItemList = [];

            Stacks.Each((input) => {
                if(input[itemPositionsStruct["stack_#i#"]] != " "){
                    itemList.Prepend( input[itemPositionsStruct["stack_#i#"]] );
                }
            });

            PivotArray[i] = ItemList;
        }

        Moves.Each((input) => {
            for(var i = 1; i <= input.howMany; i++){
                PivotArray[input.to].Append(
                    PivotArray[input.from].Pop()
                )
            }
        });

        var WordString = "";

        PivotArray.Each((input) => {
            WordString = WordString & input.Last()
        })

        print.line( WordString )
    }

}