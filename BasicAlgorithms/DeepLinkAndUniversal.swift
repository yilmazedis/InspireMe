// AppDelegate
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  if let url = launchOptions?[UIApplication.LaunchOptionsKey.url] as? URL { //Deeplink
       // process url here
   } else if let activityDictionary = launchOptions?[UIApplication.LaunchOptionsKey.userActivityDictionary] as? [AnyHashable: Any] { //Universal link
       for key in activityDictionary.keys {
           if let userActivity = activityDictionary[key] as? NSUserActivity {
               if let url = userActivity.webpageURL {
                   // process url here
               }
           }
       }
   }
  return true
}


// SceneDelegate
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    guard let url = connectionOptions.userActivities.first?.webpageURL else { return }
    makeInitialViewController(scene, with: url)
}

func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    guard let url = userActivity.webpageURL else { return }
    makeInitialViewController(scene, with: url)
}

private func makeInitialViewController(_ scene: UIScene, with url: URL) {
    window = UIWindow(frame: UIScreen.main.bounds)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = storyBoard.instantiateViewController(withIdentifier: "Maxtoria") as? ViewController else { return }
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window?.windowScene = windowScene
    vc.url = url
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
}
