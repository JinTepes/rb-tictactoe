class Player
    attr_reader :name, :identifier
    attr_accessor :turn
    
    def initialize(name, identifier)
        @name = name
        @identifier = identifier
        @turn = false
    end
end

class Gameboard
    attr_accessor :board
    def initialize
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    end

    def printBoard
        system "clear"
        puts board[0] + " | " + board[1] + " | " + board[2]
        puts "--+---+--"
        puts board[3] + " | " + board[4] + " | " + board[5]
        puts "--+---+--"
        puts board[6] + " | " + board[7] + " | " + board[8]
        puts "\n"
    end

    def changeCell(cellNum, cellValue)
        cellNum -= 1
        board[cellNum] = cellValue.to_s
    end

    def checkCell(cellNum)
        cellNum -= 1
        if board[cellNum]=="X" || board[cellNum]=="O"
            return false
        else
            return true
        end
    end
end

module Checkstate
    WINCON = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def Checkstate.wins(board)
        for i in 0...WINCON.length
            cel3="" #3 letter container
            for z in 0...3
                ads = WINCON[i][z]
                cel3 += board[ads].upcase
                if (cel3=="XXX" || cel3=="OOO")
                    return cel3.slice(0)
                end
            end
        end
        return false
    end
end
