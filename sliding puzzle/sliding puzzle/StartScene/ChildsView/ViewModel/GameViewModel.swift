//
//  GameViewModel.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/23/23.
//

import Foundation

final class GameViewModel: ObservableObject {
    
    @Published var items: [[PuzzleItemModel]] = []
    @Published var numberOfMoves = 0
    @Published var elapsedTime: String = "00:00"
    private let formmater = DateComponentsFormatter()
    private var timerCounter: TimeInterval = 0 {
        didSet {
            elapsedTime = timerCounter.createTime(formmater)
        }
    }
    private var timer: Timer?
    
    func initializeGame() {
        var puzzleItems = [1, 2, 3, 4, 5, 6, 7, 8, 0]
        puzzleItems.shuffle()
        while countInversions(puzzleItems) % 2 != 0 {
            makePuzzleSolvable(&puzzleItems)
        }
        
        items = puzzleItems
            .map { PuzzleItemModel(content: $0) }
            .chunked(by: 3)
        
        initializeTimer()
    }
    
    func resetGame() {
        stopGame()
        initializeGame()
    }
    
    func shiftPuzzleItem(_ item: PuzzleItemModel) {
        guard let coordinateOfItemTapped = findCoordinate(of: item) else {
            return
        }

        guard let coordinateOfEmptyNeighbor = findEmptyNeighbor(at: coordinateOfItemTapped) else {
            return
        }
        
        items.swapAt(coordinateOfItemTapped, coordinateOfEmptyNeighbor)
        numberOfMoves += 1
        
        if isPuzzleSolved() {
            stopGame()
           // TODO: - send trigger for show win
        }
    }
    
    private func countInversions(_ puzzle: [Int]) -> Int {
        var inversions = 0
        for i in 0..<puzzle.count - 1 {
            for j in i + 1..<puzzle.count {
                if puzzle[i] > puzzle[j] && puzzle[i] != 0 && puzzle[j] != 0 {
                    inversions += 1
                }
            }
        }
        return inversions
    }

    private func makePuzzleSolvable(_ puzzle: inout [Int]) {
        var firstIndex = 0
        var secondIndex = 0

        while firstIndex == secondIndex || puzzle[firstIndex] == 0 || puzzle[secondIndex] == 0 {
            firstIndex = Int.random(in: 0..<puzzle.count)
            secondIndex = Int.random(in: 0..<puzzle.count)
        }

        puzzle.swapAt(firstIndex, secondIndex)
    }

    private func initializeTimer() {
        timerCounter = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                          repeats: true) { [weak self] _ in
            self?.timerCounter += 1
        }
    }
    
    private func stopGame() {
        timer?.invalidate()
        timer = nil
    }
    
    private func resetTimer() {
        stopGame()
        timerCounter = 0
        numberOfMoves = 0
    }

    private func isPuzzleSolved() -> Bool {
        let solvedState = [1, 2, 3, 4, 5, 6, 7, 8, 0] // Solved state
        
        let currentState = items.flatMap { $0 }.map(\.content)
        for i in 0 ..< currentState.count {
            if currentState[i] != solvedState[i] {
                return false
            }
        }

        return true
    }
    
    private func findCoordinate(of item: PuzzleItemModel) -> Coordinate? {
        for (rowIndex, row) in items.enumerated() {
            if let columnIndex = row.firstIndex(of: item) {
                return Coordinate(row: rowIndex, column: columnIndex)
            }
        }
        return nil
    }

    private func findEmptyNeighbor(at coordinate: Coordinate) -> Coordinate? {
        for coord in coordinate.neighbors() {
            if coord.row >= 0 && coord.row < items.count
                && coord.column >= 0 && coord.column < items[0].count {
                if items[coord.row][coord.column].isEmpty() {
                    return coord
                }
            }
        }
        return nil
    }
}
