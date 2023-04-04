struct Position {
    let row: Int
    let column: Int

    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }

    init?(fromString input: String) {
        guard input.count == 2 else { return nil }

        let row = 8 - Int(String(input.last!))!
        let column = Int(input.first!.asciiValue! - Character("a").asciiValue!)

        guard row >= 0, row < 8, column >= 0, column < 8 else { return nil }

        self.row = row
        self.column = column
    }
}
