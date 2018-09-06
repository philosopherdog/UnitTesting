import Foundation

final class PersonManager {
  
  // This method saves encoded person instance to user defaults
  
  func save(person: Data, with defaults: UserDefaultsProtocol){
    defaults.set(person, forKey: "personKey")
  }
  
}
