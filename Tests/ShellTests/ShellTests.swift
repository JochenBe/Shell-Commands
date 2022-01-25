import XCTest
@testable import Shell

final class ShellTests: XCTestCase {
    func testExecute() throws {
        XCTAssertEqual(Shell.execute("echo", "Hello, World!"), "Hello, World!\n")
    }
}
