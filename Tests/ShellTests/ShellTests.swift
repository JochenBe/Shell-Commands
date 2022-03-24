import XCTest
@testable import Shell

final class ShellTests: XCTestCase {
    func testExecute() throws {
        let string = "Hello, world!"
        
        XCTAssertEqual(Shell.execute("echo", string), "\(string)\n")
                
        Shell.execute("echo", string) { s in
            XCTAssertEqual(s, "\(string)\n")
        }
    }
}
