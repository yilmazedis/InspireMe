var myJsonString = "{\"id\": \"1\", \"name\": \"yilmaz\"}"
var myRawJsonString = #"{"id": "1", "name": "yilmaz"}"#

func toJson(input: String) -> Any? {
    guard let data = input.data(using: .utf8) else { return ""}
    let json = try? JSONSerialization.jsonObject(with: data)
    return json
}

let myJson = toJson(input: myRawJsonString)
print(myJson)
