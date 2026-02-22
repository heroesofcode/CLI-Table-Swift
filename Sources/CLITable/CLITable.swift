import Foundation

/// Errors that can occur while building or printing a `CLITable`.
public enum CLITableError: Error {
    /// Thrown when a row contains a different number of columns than the table headers.
    ///
    /// - Parameters:
    ///   - expected: The number of columns required (based on `headers.count`).
    ///   - got: The number of columns provided by the row.
    case columnMismatch(expected: Int, got: Int)
}

/// A lightweight utility to build and print an ASCII table to the console.
///
/// `CLITable` stores headers and rows as strings, calculates column widths automatically,
/// and prints a formatted table using box-drawing characters.
///
/// Example:
/// ```swift
/// var table = CLITable(headers: ["Name", "Age"])
/// try table.addRow(["João", "27"])
/// try table.addRow(["Maki", "2"])
/// table.showTable()
/// ```
public struct CLITable {
    /// The table headers (one per column).
    public private(set) var headers: [String]

    /// The table rows. Each row must contain the same number of elements as `headers`.
    public private(set) var rows: [[String]]

    /// The computed width for each column, based on the longest header/cell content.
    public private(set) var columnWidths: [Int]

    /// Color applied to the table borders (if supported by the implementation).
    private let tableColor: TableColor

    /// Color applied to the cell text (if supported by the implementation).
    private let textColor: TableColor

    /// Creates a new table with the given headers and optional colors.
    ///
    /// Column widths are initialized using the header lengths. As you add rows, widths
    /// are updated to fit the largest cell in each column.
    ///
    /// - Parameters:
    ///   - headers: The header titles, one per column.
    ///   - tableColor: The color used for table borders. Defaults to `.reset`.
    ///   - textColor: The color used for cell text. Defaults to `.reset`.
    public init(
        headers: [String],
        tableColor: TableColor = .reset,
        textColor: TableColor = .reset
    ) {
        self.headers = headers
        rows = []
        columnWidths = headers.map { $0.count }
        self.tableColor = tableColor
        self.textColor = textColor
    }

    /// Adds a single row to the table.
    ///
    /// This method validates that the row has the same number of columns as `headers`.
    /// If valid, it appends the row and updates `columnWidths` to fit any larger cells.
    ///
    /// - Parameter row: The row values. Must match `headers.count`.
    /// - Throws: `CLITableError.columnMismatch` if `row.count != headers.count`.
    public mutating func addRow(_ row: [String]) throws {
        guard row.count == headers.count else {
            throw CLITableError.columnMismatch(expected: headers.count, got: row.count)
        }

        rows.append(row)

        for (index, cell) in row.enumerated() where cell.count > columnWidths[index] {
            columnWidths[index] = cell.count
        }
    }

    /// Adds multiple rows to the table.
    ///
    /// Each row is validated and added using `addRow(_:)`.
    ///
    /// - Parameter rows: A collection of rows to add.
    /// - Throws: `CLITableError.columnMismatch` if any row has an invalid column count.
    public mutating func addRows(_ rows: [[String]]) throws {
        try rows.forEach { try addRow($0) }
    }

    /// Prints the table to standard output.
    ///
    /// The table is rendered using box-drawing characters. Headers are printed first,
    /// followed by each row separated by horizontal dividers.
    ///
    /// Note: This method prints directly to the console (it does not return a string).
    public func showTable() {
        let printLine = PrintLine(
            columnWidths: columnWidths,
            tableColor: tableColor,
            textColor: textColor
        )

        printLine.line(start: "┌", middle: "┬", end: "┐", separator: "─")
        printLine.row(headers, isHeader: true)

        for (index, row) in rows.enumerated() {
            printLine.row(row)
            if index < rows.count - 1 {
                printLine.line(start: "├", middle: "┼", end: "┤", separator: "─")
            }
        }

        printLine.line(start: "└", middle: "┴", end: "┘", separator: "─")
    }
}
