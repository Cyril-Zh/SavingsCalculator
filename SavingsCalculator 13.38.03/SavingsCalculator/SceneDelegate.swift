import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let mainScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: mainScene)
        self.window = window
        
        let rootViewController = HomeViewController()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        
    }
    
}

