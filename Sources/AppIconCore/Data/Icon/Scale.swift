enum Scale: Hashable {
    case _1x
    case _2x
    case _3x
}

extension Scale {
    var rawValue: String {
        switch self {
        case ._1x:
            return "1x"
        case ._2x:
            return "2x"
        case ._3x:
            return "3x"
        }
    }

    var magnification: Float {
        switch self {
        case ._1x:
            return 1.0
        case ._2x:
            return 2.0
        case ._3x:
            return 3.0
        }
    }
}
