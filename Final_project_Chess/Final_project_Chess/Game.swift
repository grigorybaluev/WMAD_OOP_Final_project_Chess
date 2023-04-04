import Foundation

class Game {
    private var board: Board
    private var currentPlayer: PieceColor
    private var gameState: GameState

    init() {
        board = Board()
        currentPlayer = .white
        gameState = .ongoing
    }

    func start() {
        repeat {
            print("\(currentPlayer) player's turn")
            board.display()

            if let move = readMove() {
                board.move(move)
                currentPlayer = currentPlayer == .white ? .black : .white
            } else {
                print("Invalid move. Please try again.")
            }

            gameState = board.calculateGameState(for: currentPlayer)
        } while gameState == .ongoing

        print("Game over! Result: \(gameState)")
    }
    
    private func readMove() -> Move? {
        print("Enter move (e.g., 'e2 e4'):")
        guard let input = readLine() else { return nil }
        let components = input.split(separator: " ")
        if components.count == 2 {
            let from = String(components[0])
            let to = String(components[1])
            return Move(from: from, to: to, player: currentPlayer)
        }
        return nil
    }
}

struct Move {
    let from: Position
    let to: Position
    let player: PieceColor

    init?(from: String, to: String, player: PieceColor) {
        guard let fromPosition = Position(fromString: from), let toPosition = Position(fromString: to) else {
            return nil
        }
        self.from = fromPosition
        self.to = toPosition
        self.player = player
    }
}
