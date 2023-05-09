import Foundation

/// A frame of a bowling game.
public struct Frame: Equatable {

    private var id: UUID

    /// Constants defining the cases of a roll.
    public enum Roll: Equatable {
        /// A roll concluded with a spare.
        case spare

        /// A roll concluded with a strike.
        case strike

        /// A roll concluded with a number of knocked down pins.
        case open(Int)
    }

    public init(rolls: [Roll]) {
        self.id = UUID()
        self.rolls = rolls
    }

    /// The rolls of the current frame.
    ///
    /// An empty array, or unspecified positions, will be considered rolls that scored 0.
    public var rolls: [Roll] = []

    /// The score of the current frame.
    public var score: Int = .zero

    /// A boolean value indicating that the current frame is completed with a strike.
    public var hasStrike: Bool {
        rolls.contains(.strike)
    }

    /// A boolean value indicating that the current frame is completed with a spare.
    public var hasSpare: Bool {
        rolls.contains(.spare)
    }
}


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
public func calculateScore(for gameSequence: [Frame]) -> Int {

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
