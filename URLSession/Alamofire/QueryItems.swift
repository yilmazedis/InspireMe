var url = URL.init(string: "https://api.openweathermap.org/data/2.5/weather")

let queryItems = [
    URLQueryItem.init(name: "lat", value: "28.7041"),
    URLQueryItem.init(name: "lon", value: "77.1025"),
    URLQueryItem.init(name: "units", value: "metric"),
    URLQueryItem.init(name: "appid", value: "26f1ffa29736dc1105d00b93743954d2"),
]

if #available(iOS 16.0, *) {
    url?.append(queryItems: queryItems)
} else {
    // Fallback on earlier versions
    var components = URLComponents.init(url: url!, resolvingAgainstBaseURL: false)
    components?.queryItems = queryItems
    url = components?.url
}
