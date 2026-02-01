import Rainbow

public enum TableColor {
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case white
    case reset
    case hex(String)

    func apply(text: String) -> String {
        switch self {
        case .black:
            return text.black
        case .red:
            return text.red
        case .green:
            return text.green
        case .yellow:
            return text.yellow
        case .blue:
            return text.blue
        case .magenta:
            return text.magenta
        case .cyan:
            return text.cyan
        case .white:
            return text.white
        case .reset:
            return text
        case .hex(let hexCode):
            return text.hex(hexCode)
        }
    }
}

func console(_ text: String, color: TableColor, terminator: String = "\n") {
    print(color.apply(text: text), terminator: terminator)
}

func colorText(_ text: String, color: TableColor) -> String {
    return color.apply(text: text)
}
