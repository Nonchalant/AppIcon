enum WatchAppIconSet: CaseIterable {
    case _22
    case _24
    case _27_5
    case _29
    case _30
    case _32
    case _33
    case _40
    case _43_5
    case _44
    case _46
    case _50
    case _51
    case _54
    case _86
    case _98
    case _108
    case _117
    case _129
    case _1024
}

extension WatchAppIconSet: AppIconSet {
    var size: Float {
        switch self {
        case ._22:
            return 22
        case ._24:
            return 24
        case ._27_5:
            return 27.5
        case ._29:
            return 29
        case ._30:
            return 30
        case ._32:
            return 32
        case ._33:
            return 33
        case ._40:
            return 40
        case ._43_5:
            return 43.5
        case ._44:
            return 44
        case ._46:
            return 46
        case ._50:
            return 50
        case ._51:
            return 51
        case ._54:
            return 54
        case ._86:
            return 86
        case ._98:
            return 98
        case ._108:
            return 108
        case ._117:
            return 117
        case ._129:
            return 129
        case ._1024:
            return 1024
        }
    }

    var platform: Platform {
        .watch
    }

    var scales: Set<Scale> {
        switch self {
        case ._22,
             ._24,
             ._27_5,
             ._29,
             ._30,
             ._32,
             ._33,
             ._40,
             ._43_5,
             ._44,
             ._46,
             ._50,
             ._51,
             ._54,
             ._86,
             ._98,
             ._108,
             ._117,
             ._129:
            return Set([._2x])
        case ._1024:
            return Set([._1x])
        }
    }
}

