import Foundation

/// A frame of a bowling game.
public struct Frame {

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
