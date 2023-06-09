import XCTest

public class ScoreCalculatorTests: XCTestCase {
    public override func setUpWithError() throws {

    }

    public override func tearDownWithError() throws {

    }

    public func test_bonusRolls_whenGivenFrameWithStrike_shouldReturn2() {
        let dummyFrame = Frame(rolls: [.strike])
        let scoreCalculator = ScoreCalculator()

        let result = scoreCalculator.bonusRolls(for: dummyFrame)
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    public func test_bonusRolls_whenGivenFrameWithSpare_shouldReturn1() {
        let dummyFrame = Frame(rolls: [.spare])
        let scoreCalculator = ScoreCalculator()

        let result = scoreCalculator.bonusRolls(for: dummyFrame)
        let expected = 1

        XCTAssertEqual(result, expected)
    }

    public func test_bonusRolls_whenGivenFrameWithOpen_shouldReturn0() {
        let dummyFrame = Frame(rolls: [.open(6)])
        let scoreCalculator = ScoreCalculator()

        let result = scoreCalculator.bonusRolls(for: dummyFrame)
        let expected = 0

        XCTAssertEqual(result, expected)
    }

    public func test_frameScore_whenGivenFrameWithStrikeAndSequenceGoesOnWithStrike_shouldReturn30() throws {
        let dummyFrame = Frame(rolls: [.strike])

        let dummyGameSequence = [
            Frame(rolls: [.strike]),
            dummyFrame,
            Frame(rolls: [.strike]),
            Frame(rolls: [.strike]),
            Frame(rolls: [.open(7), .open(2)]),
        ]

        let scoreCalculator = ScoreCalculator()

        let score = scoreCalculator.score(for: dummyFrame, in: dummyGameSequence)
        let result = try XCTUnwrap(score)
        let expected = 10 + 10 + 10 // 30

        XCTAssertEqual(result, expected)
    }

    public func test_frameScore_whenGivenFrameWithStrikeAndSequenceGoesOnWithSpare_shouldReturn27() throws {
        let dummyFrame = Frame(rolls: [.strike])

        let dummyGameSequence = [
            Frame(rolls: [.strike]),
            dummyFrame,
            Frame(rolls: [.open(7), .spare]),
            Frame(rolls: [.open(7), .open(2)]),
        ]

        let scoreCalculator = ScoreCalculator()

        let score = scoreCalculator.score(for: dummyFrame, in: dummyGameSequence)
        let result = try XCTUnwrap(score)
        let expected = 10 + 7 + 3 + 7 // 27

        XCTAssertEqual(result, expected)
    }

    public func test_frameScore_whenGivenFrameWithStrikeAndSequenceGoesOnWithOpen_shouldReturn19() throws {
        let dummyFrame = Frame(rolls: [.strike])

        let dummyGameSequence = [
            Frame(rolls: [.strike]),
            dummyFrame,
            Frame(rolls: [.open(7), .open(2)])
        ]

        let scoreCalculator = ScoreCalculator()

        let score = scoreCalculator.score(for: dummyFrame, in: dummyGameSequence)
        let result = try XCTUnwrap(score)
        let expected = 10 + 7 + 2 // 19

        XCTAssertEqual(result, expected)
    }

    public func test_frameScore_whenGivenFrameOf20AndSequence_shouldReturn20() throws {
        let dummyFrame = Frame(rolls: [.open(6), .spare])

        let dummyGameSequence = [
            dummyFrame,
            Frame(rolls: [.strike]),
            Frame(rolls: [.open(7)]),
        ]

        let scoreCalculator = ScoreCalculator()

        let score = scoreCalculator.score(for: dummyFrame, in: dummyGameSequence)
        let result = try XCTUnwrap(score)
        let expected = 20

        XCTAssertEqual(result, expected)
    }

    public func test_rollScore_whenGivenStrike_shouldReturn10() {
        let scoreCalculator = ScoreCalculator()
        let result = scoreCalculator.score(for: .strike)
        let expected = 10
        XCTAssertEqual(result, expected)
    }

    public func test_rollScore_whenGivenSpare_shouldReturn10() {
        let scoreCalculator = ScoreCalculator()
        let result = scoreCalculator.score(for: .spare)
        let expected = 10
        XCTAssertEqual(result, expected)
    }

    public func test_rollScore_whenGivenOpenOf7_shouldReturn7() {
        let scoreCalculator = ScoreCalculator()
        let result = scoreCalculator.score(for: .open(7))
        let expected = 7
        XCTAssertEqual(result, expected)
    }

    public func test_frameScoreWithoutBonus_whenGivenFrameEndedWithStrike_shouldReturn10() throws {
        let dummyFrame = Frame(rolls: [.strike])

        let scoreCalculator = ScoreCalculator()

        let result = scoreCalculator.scoreWithoutBonus(for: dummyFrame)
        let expected = 10

        XCTAssertEqual(result, expected)
    }

    public func test_frameScoreWithoutBonus_whenGivenFrameEndedWithSpare_shouldReturn10() throws {
        let dummyFrame = Frame(rolls: [.open(6), .spare])

        let scoreCalculator = ScoreCalculator()

        let result = scoreCalculator.scoreWithoutBonus(for: dummyFrame)
        let expected = 10

        XCTAssertEqual(result, expected)
    }

    public func test_frameScoreWithoutBonus_whenGivenFrameOf7_shouldReturn7() throws {
        let dummyFrame = Frame(rolls: [.open(6), .open(1)])

        let scoreCalculator = ScoreCalculator()

        let result = scoreCalculator.scoreWithoutBonus(for: dummyFrame)
        let expected = 7

        XCTAssertEqual(result, expected)
    }
}
