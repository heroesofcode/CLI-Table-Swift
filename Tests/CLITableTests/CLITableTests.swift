import XCTest
@testable import CLITable

final class CLITableTests: XCTestCase {
    
    func testAddRow() {
        var table = CLITable(headers: ["Name", "Age", "City"])
        table.addRow(["Alice", "30", "São Paulo"])
        XCTAssertEqual(table.rows.count, 1)
    }
    
    func testAddRows() {
        var table = CLITable(headers: ["Name", "Age", "City"])
        let rows = [
            ["Alice", "30", "São Paulo"],
            ["Bob", "25", "Rio de Janeiro"],
            ["Carlos", "28", "Belo Horizonte"]
        ]
        table.addRows(rows)
        XCTAssertEqual(table.rows.count, 3)
    }
    
    func testPrintTable() {
        var table = CLITable(headers: ["Name", "Age", "City"])
        table.addRow(["Alice", "30", "São Paulo"])
        table.addRows([
            ["Bob", "25", "Rio de Janeiro"],
            ["Carlos", "28", "Belo Horizonte"]
        ])
        
        table.showTable()
    }
}
