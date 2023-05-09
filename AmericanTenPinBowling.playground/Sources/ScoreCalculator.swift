import Foundation

public struct ScoreCalculator {
    public func bonusRolls(for frame: Frame) -> Int {
        if frame.hasStrike {
            return 2
        } else if frame.hasSpare {
            return 1
        } else {
            return 0
        }
    }
}
