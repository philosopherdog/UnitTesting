import Foundation

class BillComputer {
  
  internal func compute(_ bills: [Bill])-> Double {
    // Pretend this has to gather some data from a network
    return doSomeNetworkRequest(with: bills)
  }
  
  private func doSomeNetworkRequest(with bills: [Bill])-> Double {
    // reduce loops through the array of bills
    return  bills.reduce(0.0) { (result, bill) -> Double in
      result + bill.amount
    }
  }
}
