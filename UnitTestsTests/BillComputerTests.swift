import XCTest
@testable import UnitTests

class BillComputerTests: XCTestCase {
  
  // Using a stub of BillComputer test to see if total owing is correctly updated on person
  
//  let totalOwing = 100.0
  
  class BillComputerStub: BillComputer {
    override func compute(_ bills: [Bill]) -> Double {
      return 100.0
    }
  }
  
  func test_billComputer_sets_totalOwing() {
    //Arrange
    let sut = Person()
    let billComputerStub = BillComputerStub()
    let bills = [Bill(amount: 0.0)]
    //Act
    sut.totalOwing(for: bills, with: billComputerStub)
    let result = sut.totalOwing
    let expected = 100.0
    //Assert
    XCTAssert(result == expected)
    
    
    
  }
  
}
