import Foundation

// Run Tests
FrameTests.defaultTestSuite.run()

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

// V1 - The score in frames is determined based on the
// current rolls. Not calculated based on the future rolls.
// The formula: score = score + knockedPinsCountInFrame * multiplier, multiplier -> [1,3]
/// Returns the total score of a bowling game.
///
/// The score is determined based on the current progress.
/// If the user scores using a special scoring method (e.g. strike), the
/// multiplier value increases and it is applied on the future frame score.
///
/// For open frames, or normal scoring, the multiplier is 1.
/// For spares, the multiplier remains unchanged.
/// For strikes, the multiplier is increased by 1.
///
/// Note: The multiplier value cannot exceed the value of 3.
func calculateScore() -> Int {

    // The total score.
    var score: Int = 0

    // A value that indicates the score multiplier.
    var multiplier: Int = 1

    for (index, frame) in gameSequence.enumerated() {

        // Handle the tenth frame.
        if index+1 == 10 {
            for roll in frame.rolls {
                switch roll {
                case .spare, .strike:
                    score += 10 * multiplier
                case .open(let knockedPins):
                    score += knockedPins * multiplier
                }

                // Decrease the multiplier, as there is no
                // other regulation of according bonus
                // points in the final frame.
                if multiplier > 1 {
                    multiplier -= 1
                }
            }
        } else { // Handle the other frames normally.
            if frame.hasStrike {

                // Increase the score based on the multiplier.
                score += 10 * multiplier

                // Make sure the multiplier, does not exceed,
                // the value of 3.
                // A frame can have up to a maximum of 3
                // strikes cumulated points, based on two
                // rounds bonus points rule.
                multiplier = min(multiplier + 1, 3)

            } else if frame.hasSpare {

                // Increase the score based on the multiplier.
                // The multiplier remains unchanged.
                score += 10 * multiplier

            } else {

                // Handle the case of open frames.
                for roll in frame.rolls {
                    if case let .open(knockedPins) = roll {

                        // Increase the score based on the multiplier.
                        score += knockedPins * multiplier

                        // Decrease the multiplier.
                        if multiplier > 1 {
                            multiplier -= 1
                        }
                    } else {
                        fatalError("Could not determine the score.")
                    }
                }
            }
        }
    }
    return score
}

let totalScore = calculateScore()
print("Total score:", totalScore)


// V2 - The score is calculated using the standard guidelines.
// To be implemented...
