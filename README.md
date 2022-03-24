# Shell [![Swift](https://github.com/JochenBe/Shell/actions/workflows/swift.yml/badge.svg)](https://github.com/JochenBe/Shell/actions/workflows/swift.yml) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a-Coffee-%23F9DE4A)](https://www.buymeacoffee.com/jochenbe)

Execute shell commands from your Swift applications.

## Requirements

- macOS 10.10+

## Installation

Add `https://github.com/JochenBe/Shell` in the [Swift Package Manager].

## Usage

Executing the echo command:

```Swift
// Returns "Hello, world!\n"
Shell.execute("echo", "Hello, world!")

// Returns "Hello, world!\n"
Shell.execute("echo", "Hello, world!") { string in
    // In this case, this block will run once where
    // string will be equal to "Hello, world!\n"
}
```

For more information, check the [execute reference].

## Reference

### execute

Execute a shell command.

#### Parameters

- `args`: The command followed by the arguments that should be used to execute the command.
- `using`: The block that executes when receiving data. The block takes one argument: the data as a [String] object.

#### Returns

The output of the command represented by a [String] object.

```Swift
@discardableResult static func execute(_ args: String..., using block: ((String) -> Void)? = nil) -> String
```

[swift package manager]: https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[execute reference]: https://github.com/JochenBe/Shell#execute
[string]: https://developer.apple.com/documentation/swift/string
