import Foundation

/// Responsible for rendering table borders and rows for `CLITable`.
///
/// `PrintLine` is a small helper that knows the final column widths and prints:
/// - Horizontal border lines (top/middle/bottom) using box-drawing characters
/// - Rows with padded cells and optional header separation
///
/// It also applies colors for borders and text through `TableColor`.
final class PrintLine {

    /// Final width for each column (already computed by `CLITable`).
    private let columnWidths: [Int]

    /// Color applied to table borders and separators.
    private let tableColor: TableColor

    /// Color applied to the cell text.
    private let textColor: TableColor

    /// Creates a printer configured with column widths and optional colors.
    ///
    /// - Parameters:
    ///   - columnWidths: The width of each column. Must match the number of columns printed.
    ///   - tableColor: The color used for borders/separators. Defaults to `.reset`.
    ///   - textColor: The color used for the cell contents. Defaults to `.reset`.
    init(
        columnWidths: [Int],
        tableColor: TableColor = .reset,
        textColor: TableColor = .reset
    ) {
        self.columnWidths = columnWidths
        self.tableColor = tableColor
        self.textColor = textColor
    }

    /// Prints a horizontal table line (top, middle separators, or bottom).
    ///
    /// The line is built by repeating `separator` for each column width plus padding,
    /// joined by `middle`, and wrapped by `start` and `end`.
    ///
    /// Example:
    /// - Top: `start="┌" middle="┬" end="┐" separator="─"`
    /// - Middle: `start="├" middle="┼" end="┤" separator="─"`
    /// - Bottom: `start="└" middle="┴" end="┘" separator="─"`
    ///
    /// - Parameters:
    ///   - start: Left corner character.
    ///   - middle: Character used between columns.
    ///   - end: Right corner character.
    ///   - separator: Character repeated to form the horizontal segment.
    func line(
        start: String,
        middle: String,
        end: String,
        separator: String
    ) {
        var result = start
        for (index, width) in columnWidths.enumerated() {
            if index > 0 { result += middle }
            result += String(repeating: separator, count: width + 2)
        }
        result += end
        console(result, color: tableColor)
    }

    /// Prints a single row of cells.
    ///
    /// Each cell is left-aligned and padded with spaces until it matches the column width.
    /// Border separators (`│`) are printed between columns.
    ///
    /// If `isHeader` is `true`, this method also prints a header separator line right after
    /// the row using `line(start: "├", middle: "┼", end: "┤", separator: "─")`.
    ///
    /// - Parameters:
    ///   - row: The row values to print. Must have the same number of columns as `columnWidths`.
    ///   - isHeader: Whether this row is a header. Defaults to `false`.
    func row(_ row: [String], isHeader: Bool = false) {
        console("│", color: tableColor, terminator: "")

        for (index, cell) in row.enumerated() {
            let padding = String(repeating: " ", count: columnWidths[index] - cell.count)

            let cellText = colorText(" \(cell)", color: textColor)
            let coloredPadding = colorText(padding, color: tableColor)
            let separator = colorText(" │", color: tableColor)
            let combinedText = cellText + coloredPadding + separator

            print(combinedText, terminator: "")
        }

        print()

        if isHeader {
            line(start: "├", middle: "┼", end: "┤", separator: "─")
        }
    }
}
