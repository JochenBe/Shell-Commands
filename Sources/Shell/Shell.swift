//
//  Shell.swift
//
//
//  Created by Jochen Bernard on 24/01/2022.
//

import Foundation

public struct Shell {
    /**
     Execute a shell command.
     
     - Parameters:
        - args: The command followed by the arguments that should be used to execute the command.
        - using: The block that executes when receiving data. The block takes one argument: the data as a [String] object.
     
     - Returns:
        The output of the command represented by a [String] object.
     
     [Open Reference](https://github.com/JochenBe/Shell#execute)
     
     [String]: https://developer.apple.com/documentation/swift/string
     */
    @discardableResult public static func execute(
        _ args: String...,
        using block: ((String) -> Void)? = nil
    ) -> String {
        let process = Process()
        let outputPipe = Pipe()
        
        process.standardOutput = outputPipe
        process.launchPath = "/usr/bin/env"
        process.arguments = args
        process.launch()
        
        let handle = outputPipe.fileHandleForReading
        
        if let block = block {
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
        
        let outputData = handle.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        
        return output
    }
}
