import Foundation

public final class ShowTable {
    
    private let headers: [String]
    private let rows: [[String]]
    private let columnWidths: [Int]

    public init(
        headers: [String],
        rows: [[String]],
        columnWidths: [Int]) {
        self.headers = headers
        self.rows = rows
        self.columnWidths = columnWidths
    }
    
    public func showTable() {
        let printLine = PrintLine(columnWidths: columnWidths)
        
        printLine.line(start: "┌", middle: "┬", end: "┐", separator: "─")
        printLine.row(headers, isHeader: true)
        
        for (index, row) in rows.enumerated() {
            printLine.row(row)
            indexRow(printLine: printLine, index: index)
        }
        
        printLine.line(start: "└", middle: "┴", end: "┘", separator: "─")
    }
    
    private func indexRow(printLine: PrintLine, index: Int) {
        if index < rows.count - 1 {
            printLine.line(start: "├", middle: "┼", end: "┤", separator: "─")
        }
    }
}
