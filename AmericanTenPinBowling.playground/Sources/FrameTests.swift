import XCTest

public class FrameTests: XCTestCase {

    public override func setUpWithError() throws {

    }

    public override func tearDownWithError() throws {

    }

    public func test_init_whenGivenRolls_setsRolls() {
        let frame = Frame(rolls: [])
        XCTAssertEqual(frame.rolls, [])
    }
}
