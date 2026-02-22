import Rainbow

/// A color abstraction for styling console output using `Rainbow`.
///
/// `TableColor` is used by `CLITable` / `PrintLine` to colorize:
/// - Table borders (e.g., `┌ ┬ ┐ │ ├ ┼ ┤ └ ┴ ┘`)
/// - Text inside cells
///
/// It supports:
/// - Common ANSI colors (black, red, green, etc.)
/// - No styling (`reset`)
/// - Hex colors via `Rainbow` (`.hex("#RRGGBB")` or compatible formats supported by Rainbow)
public enum TableColor {
    /// ANSI black.
    case black
    /// ANSI red.
    case red
    /// ANSI green.
    case green
    /// ANSI yellow.
    case yellow
    /// ANSI blue.
    case blue
    /// ANSI magenta.
    case magenta
    /// ANSI cyan.
    case cyan
    /// ANSI white.
    case white
    /// No color (returns the original string).
    case reset
    /// A hex color string forwarded to `Rainbow` (e.g. `"#FF8800"`).
    case hex(String)

    /// Applies the current color to the given text and returns the styled string.
    ///
    /// - Parameter text: The raw string to be colorized.
    /// - Returns: A string with ANSI escape codes (when applicable) produced by `Rainbow`.
    func apply(text: String) -> String {
        switch self {
        case .black:
            return text.black
        case .red:
            return text.red
        case .green:
            return text.green
        case .yellow:
            return text.yellow
        case .blue:
            return text.blue
        case .magenta:
            return text.magenta
        case .cyan:
            return text.cyan
        case .white:
            return text.white
        case .reset:
            return text
        case .hex(let hexCode):
            return text.hex(hexCode)
        }
    }
}

/// Prints a string to standard output using a `TableColor`.
///
/// This is a convenience wrapper around `print(_:terminator:)` that applies `Rainbow` styling.
///
/// - Parameters:
///   - text: The text to print.
///   - color: The color to apply.
///   - terminator: The string to print after the text. Defaults to a newline (`"\n"`).
func console(_ text: String, color: TableColor, terminator: String = "\n") {
    print(color.apply(text: text), terminator: terminator)
}

/// Returns a colorized version of the given text using a `TableColor`.
///
/// Useful when you need to build up a larger string before printing.
///
/// - Parameters:
///   - text: The text to colorize.
///   - color: The color to apply.
/// - Returns: The colorized string.
func colorText(_ text: String, color: TableColor) -> String {
    return color.apply(text: text)
}
