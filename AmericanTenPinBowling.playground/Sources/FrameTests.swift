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
}
