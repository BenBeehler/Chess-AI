=begin
Example board (forget [ABCDEFGH, 1-8] I need a better system)
                7
                6
                5
                4
                3    
                2
                1
                0
0 1 2 3 4 5 6 7
=end

class Square
    attr_accessor :row
    attr_accessor :column
    attr_accessor :piece

    def initialize row, column
        @row = row
        @column = column
    end
end

class Move
    
end

class Piece
    attr_accessor :name
    attr_accessor :square
    attr_accessor :value
    attr_accessor :valid
    attr_accessor :team

    def initialize name, square, value, team, valid
        @name = name
        @square = square
        @value = value
        @valid = []
        @team = team
        @valid = valid
    end
end

$board = []

x = 0
while x < 8
    y = 0
    while y < 8
        square = Square.new x,y
        $board.push square

        y+=1
    end

    x+=1
end

=begin
    PLACE PIECES ON BOARD
=end

#Init team 0 pawns
x = 0
while x < 8
    square = $board.select { 
        |item| item.row==1 and item.column==x
    }[0].piece= Piece.new "Pawn", square, 1, 0

    x+=1
end

#Init team 1 pawns
x = 0
while x < 8
    square = $board.select { 
        |item| item.row==6 and item.column==x
    }[0].piece= Piece.new "Pawn", square, 1, 1

    x+=1
end

#Init Rooks ({0,0}, {7,7}, {0,7}, {7,0})
square = $board.select { 
    |item| item.row==7 and item.column==0
}[0].piece= Piece.new "Rook", square, 1, 0, []

square = $board.select { 
    |item| item.row==7 and item.column==7
}[0].piece= Piece.new "Rook", square, 1, 0, []