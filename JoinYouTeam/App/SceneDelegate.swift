//
//  SceneDelegate.swift
//  JoinYouTeam
//
//  Created by nikita on 23.12.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
                
        UIView.appearance().tintColor = .SwiftBook.orange
        
        let navBarApperance = UINavigationBarAppearance()
        let gradient: CAGradientLayer = SceneDelegate.getHorizontalGradient(
            leftColor: .SwiftBook.pink,
            rightColor: .SwiftBook.orange
        )
        let image: UIImage! = SceneDelegate.getImageFrom(gradient)
        navBarApperance.backgroundColor = UIColor(patternImage: image)
        
        UINavigationBar.appearance().scrollEdgeAppearance = navBarApperance
        UINavigationBar.appearance().tintColor = .white
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    private class func getHorizontalGradient(leftColor: UIColor, rightColor: UIColor) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [leftColor.cgColor, rightColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        return gradient
    }
    
    private class func getImageFrom(_ gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage: UIImage?
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        
        return gradientImage
    }
}

// MARK: - UIColor extension
extension UIColor {
    struct SwiftBook {
        static let orange = UIColor.init(red: 236/255, green: 109/255, blue: 67/255, alpha: 1.0)
        static let pink = UIColor.init(red: 221/255, green: 84/255, blue: 130/255, alpha: 1.0)
        static let purple = UIColor.init(red: 82/255, green: 69/255, blue: 194/255, alpha: 1.0)
        static let blue = UIColor.init(red: 45/255, green: 54/255, blue: 169/255, alpha: 1.0)
    }
}
