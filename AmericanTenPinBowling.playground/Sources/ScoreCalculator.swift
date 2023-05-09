import Foundation

public struct ScoreCalculator {
    public func bonusRolls(for frame: Frame) -> Int {
        frame.hasStrike ? 2 : 0
    }
}
