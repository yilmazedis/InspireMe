// Equatable for Enum with associated value

enum ElementTypes: Equatable {
    case share
    case info
    case edit
    case delete
    case read(Bool)
    case alerts(Bool)

    static func == (lhs: ElementTypes, rhs: ElementTypes) -> Bool {
        switch (lhs, rhs) {
        case (.share, .share),
             (.info, .info),
             (.edit, .edit),
             (.delete, .delete):
            return true
        case let (.read(lhsValue), .read(rhsValue)),
             let (.alerts(lhsValue), .alerts(rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
