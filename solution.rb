def solve(board)
    return if board == []
    hash={}
    (0...board[0].length).each do |column|
        if board[0][column] == "O" 
            traverse(board,0,column,hash)
        end
    end
    (1...board.length).each do |row|
        if board[row][-1] == "O" 
            traverse(board,row,board[row].length-1,hash)
        end
    end
    (0...board[-1].length-1).each do |column|
        if board[-1][column] == "O" 
            traverse(board,board.length-1,column,hash)
        end
    end
    (1...board.length-1).each do |row|
        if board[row][0] == "O" 
            traverse(board,row,0,hash)
        end
    end
    (1...board.length-1).each do |row|
        (1...board[row].length-1).each do |column|
            if board[row][column] == "O"
                if hash[[row,column]] != true
                    board[row][column]="X"
                end
            end
        end
    end
end
def traverse(board,row,column,hash)
    hash[[row,column]]=true
    if row+1 < board.length
        if hash[[row+1,column]] != true
            if board[row+1][column] == "O"
                traverse(board,row+1,column,hash)
            end
        end
    end
    if column+1 < board[row].length
        if hash[[row,column+1]] != true
            if board[row][column+1] == "O"
                traverse(board,row,column+1,hash)
            end
        end
    end
    if row-1 >= 0
        if hash[[row-1,column]] != true
            if board[row-1][column] == "O"
                traverse(board,row-1,column,hash)
            end
        end
    end
    if column-1 >= 0
        if hash[[row,column-1]] != true
            if board[row][column-1] == "O"
                traverse(board,row,column-1,hash)
            end
        end
    end
end
