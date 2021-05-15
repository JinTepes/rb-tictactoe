require_relative 'gameElements.rb' #game elements ruby file has the classes

def newGame
    system "clear"
    $currentGame = Gameboard.new #this is the current game board
    puts "Player who chose 'X' will be the first one to make a move."
    print "Enter Player1 Name: "
    name = gets.chomp
    if name=="" then name="Player 1" end
    loop=true
    while loop==true do
        print "X or O?: " 
        iden = gets.upcase.chomp
        if(iden=="X" || iden=="O")
            loop=false
        end
    end
    $player1 = Player.new(name.to_s, iden.to_s) #creating player 1 object
    
    print "Enter Player2 Name: "
    name = gets.chomp
    if name=="" then name="Player 2" end

    if($player1.identifier=="X")
        iden="O"
        $player1.turn=true
        $player2 = Player.new(name.to_s, iden.to_s) #creating player 2 object
        $player2.turn=false
    else
        iden="X"
        $player2 = Player.new(name.to_s, iden.to_s) #creating player 2 object
        $player1.turn=false
        $player2.turn=true
    end

    system "clear"
    $currentGame.printBoard
    onGame
end

def resGame
    system "clear"
    $currentGame = Gameboard.new #this is the current game board
    $currentGame.printBoard
    if($player1.identifier=="X")
        iden="O"
        $player1.turn=true
        $player2.turn=false
    else
        iden="X"
        $player1.turn=false
        $player2.turn=true
    end
    onGame
end

def onGame
    ingame=true
    while ingame==true do
        if $player1.turn==true
            loop=true
            while loop==true do
                puts $player1.name+"'s Turn"
                print "Pick a Cell Number: "
                cel = gets.chomp.to_i
                if cel>0 && cel<10  && $currentGame.checkCell(cel)==true
                    $currentGame.changeCell(cel, $player1.identifier)
                    $player1.turn=false
                    $player2.turn=true
                    loop=false
                    $currentGame.printBoard
                    #check if winner
                    if Checkstate.wins($currentGame.board)!=false
                        puts $player1.name+" WINS!"
                        ingame = false
                    end
                else
                    print "Invalid Input!"
                    loop=true
                end
            end
        elsif $player2.turn==true
            loop=true
            while loop==true do
                puts $player2.name+"'s Turn"
                print "Pick a Cell Number: "
                cel = gets.chomp.to_i
                if cel>0 && cel<10  && $currentGame.checkCell(cel)==true
                    $currentGame.changeCell(cel, $player2.identifier)
                    $player2.turn=false
                    $player1.turn=true
                    loop=false
                    $currentGame.printBoard
                    #check if winner
                    if Checkstate.wins($currentGame.board)!=false
                        puts $player2.name+" WINS!"
                        ingame = false
                    end
                else
                    print "Invalid Input!"
                    loop=true
                end
            end
        end
    end
    gameOver
end

def gameOver
    puts "\n"
    puts "1: New Game   |   2: Restart Game   |   Any: End"
    print "CHOOSE: "
    chos=gets.chomp
    if chos=='1'
        newGame
    elsif chos=='2'
        resGame
    else
        system "clear"
        puts "THANK YOU FOR PLAYING! \n\n"
    end
end

newGame