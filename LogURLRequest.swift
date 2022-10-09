
func log(request: URLRequest){

    let urlString = request.url?.absoluteString ?? ""
    let components = URLComponents(string: urlString)

    let method = request.httpMethod != nil ? "\(request.httpMethod!)": ""
    let path = "\(components?.path ?? "")"
    let query = "\(components?.query ?? "")"
    let host = "\(components?.host ?? "")"

    var requestLog = "\n---------- OUT ---------->\n"
    requestLog += "\(urlString)"
    requestLog += "\n\n"
    requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
    requestLog += "Host: \(host)\n"
    for (key,value) in request.allHTTPHeaderFields ?? [:] {
        requestLog += "\(key): \(value)\n"
    }
    if let body = request.httpBody{
        let bodyString = String(data: body, encoding: .utf8) ?? "Can't render body; not utf8 encoded";
        requestLog += "\n\(bodyString)\n"
    }

    requestLog += "\n------------------------->\n";
    print(requestLog)
}

func log(data: Data?, response: HTTPURLResponse?, error: Error?){

    let urlString = response?.url?.absoluteString
    let components = URLComponents(string: urlString ?? "")

    let path = "\(components?.path ?? "")"
    let query = "\(components?.query ?? "")"

    var responseLog = "\n<---------- IN ----------\n"
    if let urlString = urlString {
        responseLog += "\(urlString)"
        responseLog += "\n\n"
    }

    if let statusCode =  response?.statusCode{
        responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
    }
    if let host = components?.host{
        responseLog += "Host: \(host)\n"
    }
    for (key,value) in response?.allHeaderFields ?? [:] {
        responseLog += "\(key): \(value)\n"
    }
    if let body = data{
        let bodyString = String(data: body, encoding: .utf8) ?? "Can't render body; not utf8 encoded";
        responseLog += "\n\(bodyString)\n"
    }
    if let error = error{
        responseLog += "\nError: \(error.localizedDescription)\n"
    }

    responseLog += "<------------------------\n";
    print(responseLog)
}
