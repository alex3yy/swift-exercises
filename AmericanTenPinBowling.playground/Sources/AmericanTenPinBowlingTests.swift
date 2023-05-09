import XCTest

public class AmericanTenPinBowlingTests: XCTestCase {
    public override func setUpWithError() throws {

    }

    public override func tearDownWithError() throws {

    }

    public func test_score_whenGivenGameSequenceOf205_shouldReturn205() {
        let dummyGameSequence = [
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

        let result = calculateScore(for: dummyGameSequence)
        let expected = 205

        XCTAssertEqual(result, expected)
    }
}
