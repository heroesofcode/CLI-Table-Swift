import XCTest
@testable import CLITable

final class CLITableTests: XCTestCase {

    func testAddRow() throws {
        var table = CLITable(headers: ["Name", "Age", "City"])
        try table.addRow(["Alice", "30", "São Paulo"])
        XCTAssertEqual(table.rows.count, 1)
    }

    func testAddRows() throws {
        var table = CLITable(headers: ["Name", "Age", "City"], tableColor: .blue)
        let rows = [
            ["Alice", "30", "São Paulo"],
            ["Bob", "25", "Rio de Janeiro"],
            ["Carlos", "28", "Belo Horizonte"]
        ]
        
        try table.addRows(rows)
        XCTAssertEqual(table.rows.count, 3)
    }

    func testPrintTable() throws {
        var table = CLITable(headers: ["Name", "Age", "City"])
        try table.addRow(["Alice", "30", "São Paulo"])
        try table.addRows([
            ["Bob", "25", "Rio de Janeiro"],
            ["Carlos", "28", "Belo Horizonte"]
        ])

        table.showTable()
    }
}
