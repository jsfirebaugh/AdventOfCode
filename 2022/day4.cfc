component {

    public function part1( boolean UseSample = false ){

        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day4_Sample.txt"
            : "./Inputs/Day4.txt"

        var TheInput = FileRead( FilePath )
            .ListToArray(chr(10))
            .Map((item) => {
                var ItemArray = item.ListToArray()
                var Elf1 = ItemArray.First().ListToArray("-")
                var Elf2 = ItemArray.Last().ListToArray("-")

                return {
                    Elf1 : {
                        Start : Elf1.First(),
                        End : Elf1.Last()
                    },

                    Elf2 : {
                        Start : Elf2.First(),
                        End : Elf2.Last()
                    }
                }
            })
            .Map((item) => {
                if ( item.Elf1.Start >= item.Elf2.Start && item.Elf1.End <= item.Elf2.End )
                    return 1
                else if ( item.Elf1.Start <= item.Elf2.Start && item.Elf1.End >= item.Elf2.End )
                    return 1
                else 
                    return 0

            })
            .Sum()

        print.line( TheInput )

    }

    public function part2( boolean UseSample = false ){
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day4_Sample.txt"
            : "./Inputs/Day4.txt"

        var TheInput = FileRead( FilePath )
            .ListToArray(chr(10))
            .Map((item) => {
                var ItemArray = item.ListToArray()
                var Elf1 = ItemArray.First().ListToArray("-")
                var Elf2 = ItemArray.Last().ListToArray("-")

                return {
                    Elf1 : {
                        Start : Elf1.First(),
                        End : Elf1.Last()
                    },

                    Elf2 : {
                        Start : Elf2.First(),
                        End : Elf2.Last()
                    }
                }
            })
            .Map((item) => {
                if( item.Elf1.Start >= item.Elf2.Start && item.Elf1.Start <= item.Elf2.End )
                    return 1
                else if( item.Elf2.Start >= item.Elf1.Start && item.Elf2.Start <= item.Elf1.End )
                    return 1
                else if( item.Elf2.End >= item.Elf1.Start && item.Elf2.End <= item.Elf1.End )
                    return 1
                else if( item.Elf1.End >= item.Elf2.Start && item.Elf1.End <= item.Elf2.End )
                    return 1
                else
                    return 0
            })
            .Sum()

        print.line( TheInput )
    }

}