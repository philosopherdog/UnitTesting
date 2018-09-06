import XCTest
@testable import UnitTests

class PersonManagerTests: XCTestCase {
  
  // Make sure MockUserDefaults is only created once
  
  func test_mockUserDefaults_created_once() {
    // Arrange
    _ = MockUserDefaults()
    let result = MockUserDefaults.timesInitialized
    let expected = 1
    // Assert
    XCTAssert(result == expected)
  }
  
  // Demonstrate need for teardown
  func test_mockUserDefaults_created_twice() {
    // Arrange
    // Act
    // Assert
  }
  
  // Test save user on PersonManager using a mock
  func test_save_user_count_1() {
    // Arrange
    let sut = MockUserDefaults()
    let person = Person(firstName: "fred", lastName: "flintstone")
    let personData = NSKeyedArchiver.archivedData(withRootObject: person)
    // Act
    let key = "personKey"
    sut.set(personData, forKey: key)
    let result = sut.values.count
    let expected = 1
    // Assert
    XCTAssert(result == expected)
    
  }
  
  // What types of tests are these and why do they qualify for that category?
}
