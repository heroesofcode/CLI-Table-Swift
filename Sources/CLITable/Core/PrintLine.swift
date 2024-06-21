import Foundation

internal final class PrintLine {
    
    private let columnWidths: [Int]
    private let tableColor: TableColor
    private let textColor: TableColor

    internal init(
        columnWidths: [Int],
        tableColor: TableColor = .reset,
        textColor: TableColor = .reset) {
        self.columnWidths = columnWidths
        self.tableColor = tableColor
        self.textColor = textColor
    }
    
    internal func line(
        start: String,
        middle: String,
        end: String,
        separator: String) {
            
        console(start, color: tableColor, terminator: "")
            
        for (i, width) in columnWidths.enumerated() {
            if i > 0 {
                console(middle, color: tableColor, terminator: "")
            }
            
            console(
                String(repeating: separator, count: width + 2),
                color: tableColor,
                terminator: "")
        }
            
        console(end, color: tableColor)
    }

    internal func row(_ row: [String], isHeader: Bool = false) {
        console("│", color: tableColor, terminator: "")
        
        for (i, cell) in row.enumerated() {
            let padding = String(repeating: " ", count: columnWidths[i] - cell.count)

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
