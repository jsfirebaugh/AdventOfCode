component {

    public function part1( boolean UseSample = true ){
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day8_Sample.txt" 
            : "./Inputs/Day8.txt"

        var Inputs = FileRead( FilePath )
            .ListToArray(chr(10))
            .Map((item) => {
                return item.ListToArray("")
            })

        var VisableTrees = 0

        // count the top and bottom row trees
        var TopAndBottomRowTrees = Inputs.First().Len() + Inputs.Last().Len()
        VisableTrees += TopAndBottomRowTrees

        // count the edge trees in the "middle" rows
        var MiddleRowEdgeTrees = ( Inputs.Len() - 2 ) * 2
        VisableTrees += MiddleRowEdgeTrees

        for( var i = 2; i <= Inputs.Len() - 1; i++ ){
            for( var j = 2; j <= Inputs.First().Len() - 1; j++ ){
                
                var CurrentTreeHeight = Inputs[i][j]

                var TreesVertical = []
                for( var k = 1; k <= Inputs[i].Len(); k++ ){
                    TreesVertical.Append( Inputs[k][j] )
                }
                
                var TreesLeft = Inputs[i]
                    .Slice( 1, j - 1 )
                    .Every((item) => { 
                        return CurrentTreeHeight > item 
                    })

                var TreesRight = Inputs[i]
                    .Slice( j + 1, Inputs[i].Len() - j )
                    .Every((item) => {
                        return CurrentTreeHeight > item
                    })

                var TreesUp = TreesVertical
                    .Slice(1, i - 1)
                    .Every((item) => {
                        return CurrentTreeHeight > item
                    })

                var TreesDown = TreesVertical
                    .Slice(i + 1, TreesVertical[i].Len() - 1)
                    .Every((item) => {
                        return CurrentTreeHeight > item
                    })

                if( TreesLeft || TreesRight || TreesUp || TreesDown ){
                    VisableTrees = VisableTrees + 1
                }
            }
        }

        print.line( VisableTrees )
    }

    public function part2( boolean UseSample = true ){
        var FilePath = Arguments.UseSample 
            ? "./Inputs/Day8_Sample.txt" 
            : "./Inputs/Day8.txt"

        var Inputs = FileRead( FilePath )
            .ListToArray(chr(10))
            .Map((item) => {
                return item.ListToArray("")
            })

        var MaxScenicCount = 0

        for( var i = 2; i <= Inputs.Len() - 1; i++ ){
            for( var j = 2; j <= Inputs.First().Len() - 1; j++ ){
                
                var CurrentTreeHeight = Inputs[i][j]

                var TreesVertical = []
                for( var k = 1; k <= Inputs[i].Len(); k++ ){
                    TreesVertical.Append( Inputs[k][j] )
                }
                
                var TreesLeft = Inputs[i]
                    .Slice( 1, j - 1 )
                    .Reverse()

                var TreesRight = Inputs[i]
                    .Slice( j + 1, Inputs[i].Len() - j )

                var TreesUp = TreesVertical
                    .Slice(1, i - 1)
                    .Reverse()

                var TreesDown = TreesVertical
                    .Slice(i + 1, TreesVertical[i].Len() - 1)

                var ScenicUp = CountScenicForArray( TreesUp, CurrentTreeHeight )
                var ScenicDown = CountScenicForArray( TreesDown, CurrentTreeHeight )
                var ScenicLeft = CountScenicForArray( TreesLeft, CurrentTreeHeight )
                var ScenicRight = CountScenicForArray( TreesRight, CurrentTreeHeight )
                var ScenicCount = ScenicUp * ScenicDown * ScenicLeft * ScenicRight

                MaxScenicCount = Max( MaxScenicCount, ScenicCount )
            }
        }

        print.line( MaxScenicCount )
    }

    private numeric function CountScenicForArray( required Array TreeArray, required Numeric TreeHeight ){
        
        var ScenicCount = 0
        
        for( Tree in TreeArray ){
            ScenicCount = ScenicCount + 1

            if( Tree >= TreeHeight){
                break;
            }
        }

        return ScenicCount
    }

}