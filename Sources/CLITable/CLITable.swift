import Foundation

public struct CLITable {
    var headers: [String]
    var rows: [[String]]
    var columnWidths: [Int]

    private let tableColor: TableColor
    private let textColor: TableColor

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
            columnWidths: columnWidths,
            tableColor: tableColor,
            textColor: textColor
        )

        print.showTable()
    }
}
