

import UIKit

// Define los temas disponibles en la aplicaciòn
enum Theme: Int{
  case `default`, dark, graphical

  //Constante para acceder al tema seleccionado
  private enum Keys{
    static let selectedTheme = "SelectedTheme"
  }

  //Variable de solo lectura
  static var current: Theme {
    let storeTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
    return Theme(rawValue: storeTheme) ?? .default
  }
  var mainColor: UIColor{
    switch self {
      case .default:
        return UIColor(red: 85.0/255.0, green: 190.0/255.0, blue: 98.0/255, alpha: 1.0)
      case .dark:
        return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 50.0/255.0, alpha: 1.0)
      case .graphical:
        return UIColor(red: 14.0/255, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
    }
  }
  var barStyle: UIBarStyle{
    switch self {
    case .default, .graphical:
      return .default
    case .dark:
      return .black
    }
  }
  var navigationBackgroundImage: UIImage?{
    return self == .graphical ? UIImage(named: "navBackground") : nil
  }
  var tabBarBackgroudImage: UIImage?{
    return self == .graphical ? UIImage(named: "navBackground") : nil
  }
  func aply(){
    //general
    UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    UserDefaults.standard.synchronize()
    
    //UINavigationBar
    UIApplication.shared.delegate?.window??.tintColor = mainColor
    UINavigationBar.appearance().barStyle = barStyle
    UINavigationBar.appearance().setBackgroundImage(navigationBackgroundImage, for: .default)
    UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
    
    //UITabBAr
    UITabBar.appearance().barStyle = barStyle
    UITabBar.appearance().backgroundImage = tabBarBackgroudImage
    
    let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.withRenderingMode(.alwaysTemplate)
    let tabResizableIndicator = tabIndicator?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 2.0))
    UITabBar.appearance().selectionIndicatorImage = tabResizableIndicator
    
    //UISegmented controller
    let controlBackground = UIImage(named: "controlBackground")?
      .withRenderingMode(.alwaysTemplate)
      .resizableImage(withCapInsets: UIEdgeInsets(top:3.0, left:3.0, bottom:3.0, right:3.0))
    let selectedControlBackground = UIImage(named: "controlSelectedBackground")?
      .withRenderingMode(.alwaysTemplate)
      .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
    UISegmentedControl.appearance()
      .setBackgroundImage(controlBackground, for: .normal, barMetrics: .default)
    UISegmentedControl.appearance()
      .setBackgroundImage(selectedControlBackground, for: .selected, barMetrics: .default)
  }
}
