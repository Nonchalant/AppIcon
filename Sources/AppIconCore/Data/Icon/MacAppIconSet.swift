enum MacAppIconSet: CaseIterable {
    case _16
    case _32
    case _128
    case _256
    case _512
}

extension MacAppIconSet: AppIconSet {
    var size: Float {
        switch self {
        case ._16:
            return 16
        case ._32:
            return 32
        case ._128:
            return 128
        case ._256:
            return 256
        case ._512:
            return 512
        }
    }

    var platform: Platform {
        .mac
    }

    var scales: Set<Scale> {
        Set([._1x, ._2x])
    }
}

