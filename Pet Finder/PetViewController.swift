import UIKit

protocol PetViewControllerDelegate: class {
  func petViewController(_ controller: PetViewController, didAdoptPet pet: Pet)
}

class PetViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var petImageView: UIImageView!

  // MARK: - Properties
  weak var delegate: PetViewControllerDelegate?
  var pet: Pet!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Theme.current.backroundCellColor
    
    title = pet.name
    
    petImageView.image = UIImage(named: pet.imageName)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adopt", style: .plain, target: self, action: #selector(adopt))
  }
}

// MARK: - Actions
private extension PetViewController {

  @objc func adopt() {
    performSegue(withIdentifier: "ShowAdopt", sender: nil)
    delegate?.petViewController(self, didAdoptPet: pet)
  }
}
