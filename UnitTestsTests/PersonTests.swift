import XCTest
@testable import UnitTests

class PersonTests: XCTestCase {
  
  class TestablePerson: Person {
    static var counter = 0
    override init(firstName: String, lastName: String) {
      super.init(firstName: firstName, lastName: lastName)
      type(of: self).counter += 1
    }
  }
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
    TestablePerson.counter = 0
    TestableBill.counter = 0
  }
  
  // 3 Types of Unit Tests
  
  // 1. Return Value
  
  func test_fullName() {
    // Arrange
    let person = Person(firstName: "fred", lastName: "flintstone")
    
    // Act
    let result = person.fullName
    let expect = "fred flintstone"
    // Assert
    XCTAssert(result == expect)
  }
  
  // 2. State Test
  
  func test_firstName() {
    // Arrange
    let person = Person(firstName: "fred", lastName: "")
    // Act
    let result = person.firstName
    let expect = "fred"
    // Assert
    XCTAssert(result == expect)
  }
  
  func test_Person_init_called_once() {
    // Arrange
    _ = TestablePerson(firstName: "", lastName: "")
    let result = TestablePerson.counter
    let expected = 1
    // Assert
    XCTAssert(result == expected)
    
  }
  
  func test_Person_init_called_twice() {
    // Arrange
    _ = TestablePerson(firstName: "", lastName: "")
    _ = TestablePerson(firstName: "", lastName: "")
    let result = TestablePerson.counter
    let expected = 2
    // Assert
    XCTAssert(result == expected, "\(result) is not \(expected)")
    
  }
  
  final class TestableBill: Bill {
    static var counter = 0
    override init(amount: Double) {
      super.init(amount: amount)
      type(of: self).counter += 1
    }
  }
  
  func test_init_bill_called_once() {
    // Arrange
    _ = TestableBill(amount: 0.0)
    let result = TestableBill.counter
    let expected = 1
    // Assert
    XCTAssert(result == expected)
  }
  
  func test_init_bill_called_twice() {
    // Arrange
    _ = TestableBill(amount: 0.0)
    _ = TestableBill(amount: 0.0)
    let result = TestableBill.counter
    let expected = 2
    // Assert
    XCTAssert(result == expected)
  }
  
  // State Test
  func test_pay_bill_gets_added_to_bills() {
    // Arrange
    let bill = TestableBill(amount: 0.0)
    let person = Person(firstName: "", lastName: "")
    // Act
    person.pay(bill)
    let result = person.bills.count
    let expected = 1
    // Assert
    XCTAssert(result == expected)
  }
  
}


















