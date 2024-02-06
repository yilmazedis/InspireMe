// Comparison
let searchQuery = "cafe"
let databaseValue = "Cafe"

// Old Way
if searchQuery.lowercased() == databaseValue.lowercased() {
    ///
}

// Better WAy
let comparisonResult = searchQuery.compare(databaseValue,
                                           options: [.caseInsensitive, .diacriticInsensitive])
if comparisonResult == .orderedSame {
    ///
}

//
