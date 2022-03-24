import XCTest
@testable import Shell

final class ShellTests: XCTestCase {
    let string = "Hello, world!"
    
    func testExecute() throws {
        XCTAssertEqual(Shell.execute("echo", string), "\(string)\n")
    }
    
    func testExecuteArray() {
        XCTAssertEqual(Shell.execute(["echo", string]), "\(string)\n")
    }
    
    func testExecuteUsingBlock() {
        let terminationStatus = Shell.execute("echo", string) { s in
            XCTAssertEqual(s, "\(self.string)\n")
        }
        
        XCTAssertEqual(terminationStatus, 0)
    }
    
    func testExecuteArrayUsingBlock() {
        let terminationStatus = Shell.execute(["echo", string]) { s in
            XCTAssertEqual(s, "\(self.string)\n")
        }
        
        XCTAssertEqual(terminationStatus, 0)
    }
}
