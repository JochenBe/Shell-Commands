import XCTest
@testable import Shell

final class ShellTests: XCTestCase {
    func testExecute() throws {
        let string = "Hello, world!"
        
        XCTAssertEqual(Shell.execute("echo", string), "\(string)\n")
                
        let terminationStatus = Shell.execute("echo", string) { s in
            XCTAssertEqual(s, "\(string)\n")
        }
        
        XCTAssertEqual(terminationStatus, 0)
    }
}
