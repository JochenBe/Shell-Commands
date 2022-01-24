//
//  Shell.swift
//
//
//  Created by Jochen Bernard on 24/01/2022.
//

import Foundation

public struct Shell {
    @discardableResult func execute(_ args: String...) -> String {
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
