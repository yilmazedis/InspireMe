
// @dynamicMemberLookup
// subscript(dynamicMember:)

@dynamicMemberLookup
struct User {
    subscript(dynamicMember member: String) -> String {
        let properties = ["firstname": "Bob", "lastname": "Dylan"]
        return properties[member, default: ""]
    }
}
let user = User()
print(user.firstname) // Bob
print(user.lastname) // Dylan
