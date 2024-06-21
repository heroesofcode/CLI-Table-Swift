import Foundation

internal final class PrintLine {
    
    private let columnWidths: [Int]

    internal init(columnWidths: [Int]) {
        self.columnWidths = columnWidths
    }
    
    internal func line(
        start: String,
        middle: String,
        end: String,
        separator: String) {
            
        print(start, terminator: "")
            
        for (i, width) in columnWidths.enumerated() {
            if i > 0 {
                print(middle, terminator: "")
            }
            print(String(repeating: separator, count: width + 2), terminator: "")
        }
            
        print(end)
    }

    internal func row(
        _ row: [String],
        isHeader: Bool = false) {
            
        print("│", terminator: "")
            
        for (i, cell) in row.enumerated() {
            let padding = String(repeating: " ", count: columnWidths[i] - cell.count)
            print(" \(cell)\(padding) │", terminator: "")
        }
            
        print()
            
        if isHeader {
            line(start: "├", middle: "┼", end: "┤", separator: "─")
        }
    }
}
