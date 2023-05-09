import Foundation

// Run Tests
FrameTests.defaultTestSuite.run()
AmericanTenPinBowlingTests.defaultTestSuite.run()
ScoreCalculatorTests.defaultTestSuite.run()

/// A valid sequence of rolls for one line of American Ten-Pin Bowling.
let gameSequence = [
    Frame(rolls: [.strike]), // 1
    Frame(rolls: [.open(2), .spare]), // 2
    Frame(rolls: [.open(4), .open(5)]), // 3
    Frame(rolls: []), // 4
    Frame(rolls: [.strike]), // 5
    Frame(rolls: [.strike]), // 6
    Frame(rolls: [.strike]), // 7
    Frame(rolls: [.strike]), // 8
    Frame(rolls: [.strike]), // 9
    Frame(rolls: [.strike, .open(3), .open(6)])  // 10
]

let totalScore = calculateScore(for: gameSequence)
print("Total score:", totalScore)


// V2 - The score is calculated using the standard guidelines.
// To be implemented...
