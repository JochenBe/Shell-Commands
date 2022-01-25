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
     
     - Returns:
        The output of the command represented by a [String](https://developer.apple.com/documentation/swift/string) object.
     
     [Open Reference](https://github.com/JochenBe/Shell#execute)
     */
    @discardableResult public static func execute(_ args: String...) -> String {
        let process = Process()
        let outputPipe = Pipe()
        
        process.standardOutput = outputPipe
        process.launchPath = "/usr/bin/env"
        process.arguments = args
        process.launch()
        process.waitUntilExit()
        
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        
        return output
    }
}
