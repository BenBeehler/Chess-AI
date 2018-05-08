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

def estabKnightMoves piece

end

class Square
    attr_accessor :row
    attr_accessor :column
    attr_accessor :piece

    def initialize row, column
        @row = row
        @column = column
        @piece = nil
    end
end

class Move
    def initialize row, column
        @row = row
        @column = column
    end

    attr_accessor :row
    attr_accessor :column
    attr_accessor :enemy
    attr_accessor :value
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
    }[0]

    $board.select { 
        |item| item.row==1 and item.column==x
    }[0].piece= Piece.new "Pawn", square, 1, 0, []

    x+=1
end

#Init team 1 pawns
x = 0
while x < 8
    square = $board.select { 
        |item| item.row==6 and item.column==x
    }[0]

    $board.select { 
        |item| item.row==6 and item.column==x
    }[0].piece= Piece.new "Pawn", square, 1, 1, []

    x+=1
end

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


#Init Rooks ({0,0}, {7,7}, {0,7}, {7,0})

begin
    $board.select { 
        |item| item.row==7 and item.column==0
    }[0].piece= Piece.new "Rook", square, 5, 1, []

    $board.select { 
        |item| item.row==7 and item.column==7
    }[0].piece= Piece.new "Rook", square, 5, 1, []

    $board.select { 
        |item| item.row==0 and item.column==7
    }[0].piece= Piece.new "Rook", square, 5, 0, []

    $board.select { 
        |item| item.row==0 and item.column==0
    }[0].piece= Piece.new "Rook", square, 5, 0, []

    $board.select { 
        |item| item.row==0 and item.column==1
    }[0].piece= Piece.new "Knight", square, 3, 0, []

    $board.select { 
        |item| item.row==0 and item.column==6
    }[0].piece= Piece.new "Knight", square, 3, 0, []

    $board.select { 
        |item| item.row==7 and item.column==1
    }[0].piece= Piece.new "Knight", square, 3, 1, []

    $board.select { 
        |item| item.row==7 and item.column==6
    }[0].piece= Piece.new "Knight", square, 3, 1, []

    $board.select { 
        |item| item.row==0 and item.column==2
    }[0].piece= Piece.new "Bishop", square, 3, 0, []

    $board.select { 
        |item| item.row==0 and item.column==5
    }[0].piece= Piece.new "Bishop", square, 3, 0, []

    $board.select { 
        |item| item.row==7 and item.column==2
    }[0].piece= Piece.new "Bishop", square, 3, 1, []

    $board.select { 
        |item| item.row==7 and item.column==5
    }[0].piece= Piece.new "Bishop", square, 3, 1, []

    $board.select { 
        |item| item.row==0 and item.column==3
    }[0].piece= Piece.new "Queen", square, 9, 0, []

    $board.select { 
        |item| item.row==7 and item.column==3
    }[0].piece= Piece.new "Queen", square, 9, 1, []

    $board.select { 
        |item| item.row==0 and item.column==4
    }[0].piece= Piece.new "King", square, 10, 0, []

    $board.select { 
        |item| item.row==7 and item.column==4
    }[0].piece= Piece.new "King", square, 10, 1, []
rescue
    puts "Failed to setup board correctly... Exiting..."
    exit
end

def pos board, row, column
    return board.select { 
        |item| item.row==row and item.column==column
    }[0]
end

def eval board
    board.each do |square|
        if square.piece != nil
            piece = square.piece
            row = square.row
            column = square.column

            if square.piece.team == 0
                if square.piece.name == "Pawn"
                    if pos($board, row+1, column) != nil
                        if pos($board, row+1, column).piece == nil
                            value = 1

                            move = Move.new row+1, column
                            move.enemy = false
                            move.value = value
                            piece.valid.push move
                        end
                    end
                    if pos($board, row+1, column+1) != nil
                        if pos($board, row+1, column+1).piece != nil
                            epiece = pos($board, row+1, column+1).piece

                            if epiece.team != piece.team
                                value = 1 + epiece.value
                                move = Move.new row+1, column+1
                                move.enemy = true
                                move.value = value
                                piece.valid.push move
                            end
                        end
                    end
                    if pos($board, row+1, column-1) != nil
                        if pos($board, row+1, column-1).piece != nil
                            epiece = pos($board, row+1, column-1).piece

                            if epiece.team != piece.team
                                value = 1 + epiece.value
                                move = Move.new row+1, column-1
                                move.enemy = true
                                move.value = value
                                piece.valid.push move
                            end
                        end
                    end 
                elsif square.piece.name == "Rook"
                elsif square.piece.name == "Knight"


                elsif square.piece.name == "Bishop"
                elsif square.piece.name == "Queen"
                elsif square.piece.name == "King"
                end
            else
                if square.piece.name == "Pawn"
                elsif square.piece.name == "Rook"
                elsif square.piece.name == "Knight"
                elsif square.piece.name == "Bishop"
                elsif square.piece.name == "Queen"
                elsif square.piece.name == "King"
                end
            end
        end
    end

    topscore = 0
    topmoves = {}
    board.each do |square|
        if square.piece != nil
            square.piece.valid.each do |move|
                if move.value >= topscore
                    topmoves[square.piece] = move
                    topscore = move.value
                end
            end
        end
    end

    r = rand(topmoves.length)-1
    piece = topmoves.keys[r]

    move = topmoves[piece]
    square = piece.square

    puts ""
    puts "-------New Move-------"
    puts "Old: #{square.row}, #{square.column}"
    puts "New: #{move.row}, #{move.column}"
    puts "Piece: #{piece.name}"

    $board.select { 
        |item| item.row==move.row and item.column==move.column
    }[0].piece= piece

    $board.select { 
        |item| item.row==square.row and item.column==square.column
    }[0].piece= nil
end

def safe one, two

end

def op square, row, column
    return square.piece.team != pos($board, row, column).team
end

def pe row, column
    return pos($board, row, column) != nil
end

def pa row, column
    return pos($board, row, column).piece != nil
end

def printBoard board
    puts ""
    str = ""

    i = 0
    board.each do |square|
        if i == 8
            puts str
            str = ""
            i = 0
        end

        if square.piece == nil
            str = str + " "
        elsif square.piece.name == "Pawn"
            str = str + "P"
        else
            str = str + "X"
        end
        i+=1
    end

    board.each do |square|
        if square.piece != nil
            #puts square.piece.name
        end
    end
end

i = 0
loop {
    eval $board

    if i == 10
        break
    end

    i+=1
}