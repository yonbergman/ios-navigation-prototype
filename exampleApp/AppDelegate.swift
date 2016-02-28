import UIKit
import Astrolabe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var navigationController: UINavigationController?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    navigationController = UINavigationController()
    Astrolabe.scheme = "exampleApp"
    Astrolabe.navigationController = navigationController
    Astrolabe.router.preroutingMethod = {
      Astrolabe.Modules.home.showHome(false)
    }
    Astrolabe.Modules.setup()
    Astrolabe.Modules.home.showHome()
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }

  func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
    return Astrolabe.router.route(url)
  }

}

