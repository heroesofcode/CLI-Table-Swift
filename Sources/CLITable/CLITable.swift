import Foundation

public struct CLITable {
    private var headers: [String]
    private var rows: [[String]]
    private var columnWidths: [Int]

    public init(headers: [String]) {
        self.headers = headers
        self.rows = []
        self.columnWidths = headers.map { $0.count }
    }

    public mutating func addRow(_ row: [String]) {
        guard row.count == headers.count else {
            print("Number of columns in row does not match number of headers")
            return
        }
        
        rows.append(row)
        
        for (i, cell) in row.enumerated() {
            if cell.count > columnWidths[i] {
                columnWidths[i] = cell.count
            }
        }
    }

    public mutating func addRows(_ rows: [[String]]) {
        for row in rows {
            addRow(row)
        }
    }
    
    public func showTable() {
        let print = ShowTable(
            headers: headers,
            rows: rows,
            columnWidths: columnWidths)
        
        print.showTable()
    }
}
