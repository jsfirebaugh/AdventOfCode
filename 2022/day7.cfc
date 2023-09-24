component {

    public function part1( boolean UseSample = false ){
        
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day7_Sample.txt" 
            : "./Inputs/Day7.txt"

        var Inputs = FileRead( FilePath )
            .ListToArray(chr(10))
            .Map((item) => {
                return item.ListToArray(" ")
            })

        print.line( Inputs )
    }

}