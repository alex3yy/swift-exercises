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

    public func score(for roll: Frame.Roll) -> Int {
        switch roll {
        case .strike:
            return 10
        case .spare:
            return 10
        case .open(let knockedPins):
            return knockedPins
        }
    }

    public func scoreWithoutBonus(for frame: Frame) -> Int {
        if frame.hasStrike {
            return self.score(for: .strike)
        }
        return 0
    }

    public func score(for frame: Frame, in gameSequence: [Frame]) -> Int? {
        var score = 0

        let bonusRolls = bonusRolls(for: frame)

        guard let frameIndex = gameSequence.firstIndex(where: { $0 == frame }) else {
            return nil
        }

        let candidateFrames = gameSequence.dropFirst(frameIndex+1)
        let candidateRolls = candidateFrames.flatMap({ $0.rolls })

        if candidateRolls.count < bonusRolls {
            return nil
        }

        switch bonusRolls {
        case 1:
            score += 10
            let roll = candidateRolls[0]
            switch roll {
            case .spare:
                score += 10
            case .strike:
                score += 10
            case .open(let knockedPins):
                score += knockedPins
            }
        case 2:
            score += 10
            for index in 0...bonusRolls-1 {
                let roll = candidateRolls[index]
                switch roll {
                case .spare:
                    score += 10
                case .strike:
                    score += 10
                case .open(let knockedPins):
                    score += knockedPins
                }
            }
        default:
            break
        }

        return score
    }
}
