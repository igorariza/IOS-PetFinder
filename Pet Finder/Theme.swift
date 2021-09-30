

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
  var backroundCellColor : UIColor{
    switch self {
    case .default, .graphical:
      return UIColor.white
    case .dark:
      return UIColor(white: 0.4, alpha: 1.0)
    }
  }
  var textCellColor : UIColor{
    switch self {
    case .default, .graphical:
      return UIColor.black
    case .dark:
      return UIColor.white
    }
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
    
    //Custom esteper
    UIStepper.appearance().setBackgroundImage(controlBackground, for: .normal)
    UIStepper.appearance().setBackgroundImage(controlBackground, for: .disabled)
    UIStepper.appearance().setBackgroundImage(controlBackground, for: .highlighted)
    UIStepper.appearance().setDecrementImage(UIImage(named: "fewerPaws"), for: .normal)
    UIStepper.appearance().setIncrementImage(UIImage(named: "morePaws"), for: .normal)
    
    
    //Custom Slider
    UISlider.appearance().setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
    UISlider.appearance().setMaximumTrackImage(UIImage(named: "maximumTrack")?.resizableImage(withCapInsets: UIEdgeInsets(top:0, left:0, bottom:0, right:6)), for: .normal)
    UISlider.appearance().setMinimumTrackImage(UIImage(named: "minimumTrack")?
      .withRenderingMode(.alwaysTemplate)
      .resizableImage(withCapInsets: UIEdgeInsets(top:0, left:6, bottom:0, right:0)), for: .normal)
    
    //UISwitch
    UISwitch.appearance().onTintColor = mainColor.withAlphaComponent(0.4)
    UISwitch.appearance().thumbTintColor = mainColor
    
    //UITableViewCell
    UITableViewCell.appearance().backgroundColor = backroundCellColor
    UILabel.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).textColor = textCellColor
    
  }
}
