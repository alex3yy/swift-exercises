import XCTest

public class FrameTests: XCTestCase {

    public override func setUpWithError() throws {

    }

    public override func tearDownWithError() throws {

    }

    public func test_init_whenGivenRolls_setsRolls() {
        let frame = Frame(rolls: [.open(2), .spare])
        XCTAssertEqual(frame.rolls, [.open(2), .spare])
    }
}
