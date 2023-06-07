// A type that presents a mathematical set interface to a bit set.
// Option sets provide a convenient way to represent a set of values that can be combined and checked for membership. They are particularly useful when working with a finite number of discrete options or settings.
struct Permissions: OptionSet {
    let rawValue: Int
    
    static let read = Permissions(rawValue: 1 << 0)
    static let write = Permissions(rawValue: 1 << 1)
    static let execute = Permissions(rawValue: 1 << 2)
    static let all: Permissions = [.read, .write, .execute]
}

// Usage example:
var userPermissions: Permissions = [.read, .write]

if userPermissions.contains(.read) {
    print("User has read permission")
}

if userPermissions.contains(.write) {
    print("User has write permission")
}

if userPermissions.contains(.execute) {
    print("User has execute permission")
} else {
    print("User does not have execute permission")
}

// Adding and removing permissions
userPermissions.insert(.execute)
userPermissions.remove(.read)
