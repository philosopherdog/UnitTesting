import Foundation
@testable import UnitTests


final class MockUserDefaults: UserDefaultsProtocol {
  
  static var timesInitialized = 0
  
  init() {
    type(of: self).timesInitialized += 1
  }
  
  var values: [String: Data] = [:]
  
  // Here's where we override the UserDefault's Methods defined in the Protocol
  
  func set(_ value: Any?, forKey defaultName: String) {
    guard let result = value as? Data else { return }
    values[defaultName] = result
  }
  
  func data(forKey: String)-> Data? {
    return values[forKey]
  }
}
