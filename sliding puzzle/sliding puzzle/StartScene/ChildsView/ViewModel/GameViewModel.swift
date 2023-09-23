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
        items = Array(0...8)
            .shuffled()
            .map { PuzzleItemModel(content: $0) }
            .chunked(by: 3)
        initializeTimer()
    }
    
    func resetGame() {
        stopTimer()
        timerCounter = 0
        initializeGame()
        numberOfMoves = 0
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
    }

    func initializeTimer() {
        timerCounter = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                          repeats: true) { [weak self] _ in
            self?.timerCounter += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        stopTimer()
        timerCounter = 0
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
