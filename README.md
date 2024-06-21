## CLI-Table-Swift

[![Platform Compatibility](https://img.shields.io/badge/Platforms-%20macOS%20-orange)]()

Build Table for command line tools for macOS written in Swift

<img src="https://github.com/heroesofcode/CLI-Table-Swift/blob/develop/assets/example.gif?raw=true">

```
┌─────────┬─────┬────────────────┐
│ Name    │ Age │ City           │
├─────────┼─────┼────────────────┤
│ Matheus │ 23  │ São Paulo      │
├─────────┼─────┼────────────────┤
│ Alice   │ 30  │ Rio de Janeiro │
└─────────┴─────┴────────────────┘
```

## Usage

Default with terminal color
```swift
import CLITable

let headers = ["Name", "Age", "City"]
        
var table = CLITable(headers: headers)

let rows = [
    ["Matheus", "23", "São Paulo"],
    ["Alice", "30", "Rio de Janeiro"]
]
        
table.addRows(rows)
table.showTable()
```
If you prefer, you can add the row like this
```swift
let headers = ["Name", "Age", "City"]
        
var table = CLITable(headers: headers)
        
table.addRow(["Matheus", "23", "São Paulo"])
table.addRow(["Matheus", "23", "São Paulo"])
        
table.showTable()
```

To customize the table you can add color to the line and text or just some of them
```swift
var table = CLITable(headers: headers, tableColor: .blue, textColor: .green)

or

var table = CLITable(headers: headers, tableColor: .blue)

or

var table = CLITable(headers: headers, textColor: .green)
```

## Contributing

To contribute, just fork this project and then open a pull request, feel free to contribute, bring ideas and raise any problem in the issue tab.

## License

CLITable is released under the MIT license. See [LICENSE](https://github.com/heroesofcode/CLI-Table-Swift/blob/main/LICENSE) for details.
