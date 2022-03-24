//
//  Shell.swift
//
//
//  Created by Jochen Bernard on 24/01/2022.
//

import Foundation

public struct Shell {
    @discardableResult private static func execute(
        _ args: [String],
        using block: ((String) -> Void)? = nil
    ) -> Int32 {
        let process = Process()
        let outputPipe = Pipe()
        
        process.standardOutput = outputPipe
        process.launchPath = "/usr/bin/env"
        process.arguments = args
        process.launch()
        
        if let block = block {
            let handle = outputPipe.fileHandleForReading
            handle.waitForDataInBackgroundAndNotify()
            
            let observer = NotificationCenter.default.addObserver(
                forName: .NSFileHandleDataAvailable,
                object: handle,
                queue: nil
            ) { _ in
                guard let string = String(data: handle.availableData, encoding: .utf8) else { return }
                block(string)
            }
            
            process.waitUntilExit()
            
            NotificationCenter.default.removeObserver(observer)
        } else {
            process.waitUntilExit()
        }
        
        return process.terminationStatus
    }
    
    /**
     Execute a shell command.
     
     - Parameters:
        - args: The command followed by the arguments that should be used to execute the command.
        - using: The block that executes when receiving data. The block takes one argument: the new data as a [String] object.
     
     - Returns:
        The exit status the receiver’s executable returns.
     
     [Open Reference](https://github.com/JochenBe/Shell#execute)
     
     [String]: https://developer.apple.com/documentation/swift/string
     */
    @discardableResult public static func execute(
        _ args: String...,
        using block: ((String) -> Void)? = nil
    ) -> Int32 {
        execute(args, using: block)
    }
    
    /**
     Execute a shell command.
     
     - Parameters:
        - args: The command followed by the arguments that should be used to execute the command.
     
     - Returns:
        The output of the command represented by a [String] object.
     
     [Open Reference](https://github.com/JochenBe/Shell#execute)
     
     [String]: https://developer.apple.com/documentation/swift/string
     */
    @discardableResult public static func execute(
        _ args: String...
    ) -> String {
        var strings: [String] = []
        
        execute(args) { string in
            strings.append(string)
        }
        
        return strings.joined()
    }
}
