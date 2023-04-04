import Foundation

class Piece {
    let type: PieceType
    let color: PieceColor
    var position: Position
    var symbol: String

    init(type: PieceType, color: PieceColor, position: Position, symbol: String) {
        self.type = type
        self.color = color
        self.position = position
        self.symbol = symbol
    }

    func canMove(to position: Position, on board: Board) -> Bool {
        fatalError("Subclasses must implement this method")
    }
}

//♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜  8
//♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟  7
//. . . . . . . .  6
//. . . . . . . .  5
//. . . . . . . .  4
//. . . . . . . .  3
//♙ ♙ ♙ ♙ ♙ ♙ ♙ ♙  2
//♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖  1


class Pawn: Piece {
    init(color: PieceColor, position: Position) {
        let symbol = color == .white ? "♟" : "♙"
        super.init(type: .pawn, color: color, position: position, symbol: symbol)
    }

    override func canMove(to position: Position, on board: Board) -> Bool {
        return false
    }
}

class Rook: Piece {
    init(color: PieceColor, position: Position) {
        let symbol = color == .white ? "♜" : "♖"
        super.init(type: .pawn, color: color, position: position, symbol: symbol)
    }

    override func canMove(to position: Position, on board: Board) -> Bool {
        return false
    }
}


class Knight: Piece {
    init(color: PieceColor, position: Position) {
        let symbol = color == .white ? "♞" : "♘"
        super.init(type: .pawn, color: color, position: position, symbol: symbol)
    }

    override func canMove(to position: Position, on board: Board) -> Bool {
        return false
    }
}


class Bishop: Piece {
    init(color: PieceColor, position: Position) {
        let symbol = color == .white ? "♝" : "♗"
        super.init(type: .pawn, color: color, position: position, symbol: symbol)
    }

    override func canMove(to position: Position, on board: Board) -> Bool {
        return false
    }
}


class Queen: Piece {
    init(color: PieceColor, position: Position) {
        let symbol = color == .white ? "♛" : "♕"
        super.init(type: .pawn, color: color, position: position, symbol: symbol)
    }

    override func canMove(to position: Position, on board: Board) -> Bool {
        return false
    }
}


class King: Piece {
    init(color: PieceColor, position: Position) {
        let symbol = color == .white ? "♚" : "♔"
        super.init(type: .pawn, color: color, position: position, symbol: symbol)
    }

    override func canMove(to position: Position, on board: Board) -> Bool {
        return false
    }
}

// Implement other piece classes (Rook, Knight, Bishop, Queen, King) similarly
