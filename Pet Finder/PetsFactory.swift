import Foundation

class PetsFactory {

  // MARK: - Properties
  static let sharedProvider = PetsFactory()
  
  let pets: [Pet]
  private(set) var adoptedPets: [Pet] = []

  // MARK: - Initializers
  init() {
    self.pets = [Pet(name: "Krusty", type: "Golden Retriever", imageName: "pet0"),
                 Pet(name: "Homer", type: "Terrier Mezclado", imageName: "pet1"),
                 Pet(name: "Bart", type: "Freaked Out", imageName: "pet2"),
                 Pet(name: "Tiger", type: "Bigotes sensibles", imageName: "pet3"),
                 Pet(name: "Nugget", type: "Cazaratones", imageName: "pet4"),
                 Pet(name: "Serdi", type: "Border Collie", imageName: "pet5"),
                 Pet(name: "Amante", type: "Raza Mixta", imageName: "pet6"),
                 Pet(name: "Blancanieves", type: "Gato Negro", imageName: "pet7")]
  }

  // MARK: - Internal
  func adopt(pet: Pet) {
    guard !adoptedPets.contains(pet) else { return }

    adoptedPets.append(pet)
  }
}
