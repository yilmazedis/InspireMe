
func handleUserName(name: String?) {
//        if name != nil, !name!.isEmpty {
//
//        }

    if !name.isNilOrEmpty {

    }
}

extension Optional where Wrappered == String {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}


extension Optional<String>{
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}


extension String? {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}

extension Optional<Array> {

}

extension Optional<Sequence> {

}
