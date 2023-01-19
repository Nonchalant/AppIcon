enum IosAppIconSet: CaseIterable {
    case _20
    case _29
    case _38
    case _40
    case _60
    case _64
    case _68
    case _76
    case _83_5
    case _1024
}

extension IosAppIconSet: AppIconSet {
    var size: Float {
        switch self {
        case ._20:
            return 20
        case ._29:
            return 29
        case ._38:
            return 38
        case ._40:
            return 40
        case ._60:
            return 60
        case ._64:
            return 64
        case ._68:
            return 68
        case ._76:
            return 76
        case ._83_5:
            return 83.5
        case ._1024:
            return 1024
        }
    }

    var platform: Platform {
        .ios
    }

    var scales: Set<Scale> {
        switch self {
        case ._20, ._29, ._38, ._40, ._60, ._64:
            return Set([._2x, ._3x])
        case ._68, ._76, ._83_5:
            return Set([._2x])
        case ._1024:
            return Set([._1x])
        }
    }
}
