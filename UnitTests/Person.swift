import Foundation

/// Person model object that knows how to encode/decode


class Person: NSObject, NSCoding {
  
  // MARK: Properties
  
  internal let firstName: String
  internal let lastName: String
  
  internal var fullName: String {
    get {
      return "\(firstName) \(lastName)"
    }
  }
  
  // MARK: Encoding/Decoding
  
  internal struct Key {
    // Used to avoid string literal keys
    
    static let firstName = "firstNameKey"
    static let lastName = "lastNameKey"
  }
  
  internal func encode(with aCoder: NSCoder) {
    aCoder.encode(self.firstName, forKey: Key.firstName)
    aCoder.encode(self.lastName, forKey: Key.lastName)
  }
  
  internal required convenience init(coder aDecoder: NSCoder) {
    let firstName = aDecoder.decodeObject(forKey: Key.firstName) as? String
    let lastName = aDecoder.decodeObject(forKey: Key.lastName) as? String
    self.init(firstName: firstName ?? "", lastName: lastName ?? "")
  }
  
  // MARK: Designated Initializer
  
  internal init(firstName: String = "", lastName: String = "") {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  //MARK: Bills (Use for State Test)
  
  internal var bills = [Bill]()
  
  internal func pay(_ bill: Bill) {
    bills.append(bill)
  }
  
  //MARK: Total Owing (Used for Stub Test)
  
  internal var totalOwing: Double?
  
  internal func totalOwing(for bills: [Bill], with billComputer: BillComputer) {
    self.totalOwing = billComputer.compute(bills)
  }
  
}
