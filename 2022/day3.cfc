component {

    public function part1( boolean UseSample = false ){
        
        var Alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day3_Sample.txt"
            : "./Inputs/Day3.txt"

        var Rucksack = FileRead(FilePath)
            .ListToArray(chr(10))
            .Map((item) => {
                var FirstHalf = item.Left(item.len() / 2)
                var LastHalf = item.right(item.len() / 2)

                for( var i = 1; i <= FirstHalf.len(); i++ ){
                    if(LastHalf.contains(FirstHalf[i])){
                        return Alphabet.find(FirstHalf[i])
                    }
                }

                return 0
            })
            .Sum()

        print.line(Rucksack)
    }

    public function part2( boolean UseSample = false ){
        var Alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day3_Sample.txt"
            : "./Inputs/Day3.txt"

        var Rucksack = FileRead(FilePath)
            .ListToArray(chr(10))
            .Map((item) => {
                return item.ListRemoveDuplicates("").ListToArray("")
            })

        var DuplicateRucksackItems = []

        for(i = 1; i <= Rucksack.len(); i = i + 3){
            Rucksack[i].each((item) => {
                if( Rucksack[i+1].contains(item) && Rucksack[i+2].contains(item) ){
                    DuplicateRucksackItems.Append(item)
                }
            })
        }

        var ItemSum = DuplicateRucksackItems.Map((item) => {
            return Alphabet.Find(item.ToString())
        }).Sum()
        
        print.line(ItemSum)
    }

}