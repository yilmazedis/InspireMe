struct ID<T>: Equtable {
    private let value = UUID()
}

struct Person {
    let id = ID<Self>()
    let name: String
}

struct Location {
    let id = ID<Self>()
    let coordinates: (Double, Double)
}

func handle(location: [Location]) {
    let me = Person(name: "Yılamz")
    let filtered = location.filter {$0.id == me.id}

    // Cannot convert value of type "ID<Person>" to expected argument type ID<Location>
}
