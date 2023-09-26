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
    @Published var isFinished: Bool = false
    private let formmater = DateComponentsFormatter()
    private var timerCounter: TimeInterval = 0 {
        didSet {
            elapsedTime = timerCounter.createTime(formmater)
        }
    }
    private var timer: Timer?
    
    func initializeGame() {
        var puzzleItems = [1, 2, 3, 4, 5, 6, 7, 8, 0]
            .map { PuzzleItemModel(content: $0) }
        puzzleItems.shuffle()
        while puzzleItems.countInversions() % 2 != 0 {
            puzzleItems.makePuzzleSolvable()
        }
        
        items = puzzleItems
            .chunked(by: 3)
        
        initializeTimer()
    }
    
    private func initializeTimer() {
        timerCounter = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                          repeats: true) { [weak self] _ in
            self?.timerCounter += 1
        }
    }
    
    func resetGame() {
        stopGame()
        numberOfMoves = 0
        timerCounter = 0
        initializeGame()
    }
    
    private func stopGame() {
        timer?.invalidate()
        timer = nil
    }
    
    func shiftPuzzleItem(_ item: PuzzleItemModel) {
        guard let coordinateOfItemTapped = items.findCoordinate(of: item) else {
            return
        }

        guard let coordinateOfEmptyNeighbor = items.findEmptyNeighbor(at: coordinateOfItemTapped) else {
            return
        }
        
        items.swapAt(coordinateOfItemTapped, coordinateOfEmptyNeighbor)
        numberOfMoves += 1
        
        if isPuzzleSolved() {
            stopGame()
            isFinished.toggle()
        }
    }

    private func isPuzzleSolved() -> Bool {
        let solvedState = [1, 2, 3, 4, 5, 6, 7, 8, 0] // Solved state
        
        let currentState = items.flatMap { $0 }
        for i in 0 ..< currentState.count {
            if currentState[i].content != solvedState[i] {
                return false
            }
        }

        return true
    }
}
