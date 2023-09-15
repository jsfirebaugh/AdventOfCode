component {
    
    public function part1(){
        var MostCalories = 0
        var CurrentElfCalories = 0

        FileRead("./Inputs/Day1.txt")
            .ListToArray(chr(10), true)
            .Each((item) => {
                CurrentElfCalories = IsEmpty(item) 
                    ? 0
                    : CurrentElfCalories + item

                MostCalories = CurrentElfCalories > MostCalories 
                    ? CurrentElfCalories
                    : MostCalories
            })

        print.line(MostCalories)

        var Elves = [0]

        FileRead("./Inputs/Day1.txt")
            .ListToArray(chr(10), true)
            .Each((item) => {
                item.IsEmpty() 
                    ? Elves.append(0)
                    : Elves[ Elves.len() ] += item
            })

        print.line( Elves.max() )
    }
}