component {

    public function part1( boolean UseSample = false ){

        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day6_Sample.txt" 
            : "./Inputs/Day6.txt"

        var Inputs = FileRead( FilePath )
            .ListToArray(chr(10))
            .Each((input) => {
                for( var i = 4; i <= input.Len(); i++ ){
                    var WindowString = input.Mid( i - 3, 4)

                    if( WindowString == WindowString.ListRemoveDuplicates("") ){
                        print.line( i )
                        break;
                    }
                }
            })

    }

}