import Foundation

// UserDefaultsProtocol lists 2 (there are others) method signatures of Apple's actual UserDefaults class.
// By "extracting" this protocol we can create a new fake object that we control for testing purposes

protocol UserDefaultsProtocol: class {
  func set(_ value: Any?, forKey defaultName: String)
  func data(forKey: String)-> Data?
}

// Apple's UserDefaults class now conforms to out protocol!
// Apple's class  already implements the methods! So we don't need to do anything.

extension UserDefaults: UserDefaultsProtocol {}


