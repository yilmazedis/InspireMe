let ssid = "Redmi Note 9"
let passphrase = "internet"

WiFiManager.applyConfiguration(ssid: ssid, passphrase: passphrase) { connected, error in
  if let error = error {
    print("Error connecting to Wi-Fi: \(error.localizedDescription)")
  } else if connected {
    print("Successfully connected to Wi-Fi")
  } else {
    print("Failed to connect to Wi-Fi")
  }
}
}

enum WiFiManager {
static func applyConfiguration(ssid: String, passphrase: String,
                             isWEP: Bool = false, joinOnce: Bool = true,
                             completion: @escaping (Bool, Error?) -> Void) {
  let configuration = NEHotspotConfiguration(ssid: ssid, passphrase: passphrase, isWEP: isWEP)
  configuration.joinOnce = joinOnce

  NEHotspotConfigurationManager.shared.apply(configuration) { error in
      if let error = error {
          completion(false, error)
      } else {
          completion(true, nil)
      }
  }
}
}
