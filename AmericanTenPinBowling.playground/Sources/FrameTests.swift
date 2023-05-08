import XCTest

public class FrameTests: XCTestCase {

    public override func setUpWithError() throws {

    }

    public override func tearDownWithError() throws {

    }

    public func test_init_whenGivenRolls_setsRolls() {
        let dummyRolls: [Frame.Roll] = [.open(2), .spare]
        let frame = Frame(rolls: dummyRolls)
        XCTAssertEqual(frame.rolls, dummyRolls)
    }

    public func test_rollEnum_equalityWithoutAssociatedValues() {
        let dummyRoll: Frame.Roll = .strike
        XCTAssertEqual(Frame.Roll.strike, dummyRoll)
    }

    public func test_rollEnum_equalityWithAssociatedValues() {
        let dummyValue = 2
        let dummyRoll: Frame.Roll = .open(dummyValue)
        guard case let Frame.Roll.open(value) = dummyRoll else {
            XCTFail("Expected \(Frame.Roll.open(dummyValue)), but instead it was \(dummyRoll)")
            return
        }
        XCTAssertEqual(value, dummyValue)
    }
}
