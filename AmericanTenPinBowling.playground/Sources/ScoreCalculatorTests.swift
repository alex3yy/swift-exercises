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
}
