# Shell [![Swift](https://github.com/JochenBe/Shell/actions/workflows/swift.yml/badge.svg)](https://github.com/JochenBe/Shell/actions/workflows/swift.yml) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a-Coffee-%23F9DE4A)](https://www.buymeacoffee.com/jochenbe)

Execute shell commands from your Swift applications.

## Requirements

- macOS 10.10+

## Installation

Add `https://github.com/JochenBe/Shell` in the [Swift Package Manager].

## Usage

Executing the echo command:

```Swift
// Returns "Hello, World!\n"
Shell().execute("echo", "Hello, World!")
```

For more information, check the [execute reference].

## Reference

### execute

Execute a shell command.

#### Parameters

- `args`: The command followed by the arguments that should be used to execute the command.

#### Returns

The output of the command represented by a [String] object.

```Swift
@discardableResult func execute(_ args: String...) -> String
```

[swift package manager]: https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[execute reference]: https://github.com/JochenBe/Shell#execute
[string]: https://developer.apple.com/documentation/swift/string
