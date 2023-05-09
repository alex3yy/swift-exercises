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
}
