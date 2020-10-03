enum Scale: String, Hashable {
    case single = "1x"
    case twice  = "2x"
    case triple = "3x"
}

extension Scale {
    var magnification: Float {
        switch self {
        case .single:
            return 1.0
        case .twice:
            return 2.0
        case .triple:
            return 3.0
        }
    }
}
