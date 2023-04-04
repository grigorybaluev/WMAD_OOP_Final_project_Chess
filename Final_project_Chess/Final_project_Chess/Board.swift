import Foundation

class Board: BoardDisplay {
    var squares: [[Piece?]]
    // Other properties, such as kings' positions and castling rights, for more complex rules

    init() {
        squares = Array(repeating: Array(repeating: nil, count: 8), count: 8)
        setupPieces()
    }

    func move(_ move: Move) {
        let from = move.from
        let to = move.to
        let piece = squares[from.row][from.column]

        if let piece = piece, piece.color == move.player, piece.canMove(to: to, on: self) {
            squares[from.row][from.column] = nil
            squares[to.row][to.column] = piece
            piece.position = to
            // Additional rules, such as castling, pawn promotion, and en passant, should be implemented here
        } else {
            print("Invalid move!")
        }
    }
    
    func calculateGameState(for color: PieceColor) -> GameState {
        // Implement game state calculation logic here
        // For example, check for check, checkmate, stalemate, and draw
        // For simplicity, you can return .ongoing, but you should implement the actual logic
        return .ongoing
    }


    func piece(at position: Position) -> Piece? {
        return squares[position.row][position.column]
    }

    func isPositionEmpty(_ position: Position) -> Bool {
        return squares[position.row][position.column] == nil
    }

    // Implement other utility methods like checking check, checkmate, and stalemate

    private func setupPieces() {
        // Setup pawns
        for i in 0..<8 {
            squares[1][i] = Pawn(color: .black, position: Position(row: 1, column: i))
            squares[6][i] = Pawn(color: .white, position: Position(row: 6, column: i))
        }

        // Setup other pieces
        let pieceTypes: [PieceType] = [.rook, .knight, .bishop, .queen, .king, .bishop, .knight, .rook]
        for i in 0..<8 {
            squares[0][i] = pieceTypes[i].initialize(color: .black, position: Position(row: 0, column: i))
            squares[7][i] = pieceTypes[i].initialize(color: .white, position: Position(row: 7, column: i))
        }
    }
}

protocol BoardDisplay {
    func display()
}

extension BoardDisplay where Self: Board {
    func display() {
        for row in 0..<8 {
            for col in 0..<8 {
                let piece = squares[row][col]
                let symbol = piece?.symbol ?? "."
                print(symbol, terminator: " ")
            }
            print()
        }
    }
}
