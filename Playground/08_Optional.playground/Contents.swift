import UIKit

/* Optional
- 값이 있을 수도 있고, 없으 수도 있음
- nil을 포함 할 수도 있고, 아닐 수 도 있다. */

var constantNum = 100

// let optionalConstant = nil
let optionalConstant : Int! = nil  // 가져올 때 ! 쓴다.
let optionalConstant2: Int? = nil  // 선언할 때 ? 쓴다.


//-----------------
// Optaional 계산 1
var constantNum1: Int! = 100
print(constantNum1 + 10)

// Nil 값에 더하기는 안된다.
constantNum1 = nil
//constantNum1 + 1
//print(constantNum1!)

// Nil값 switch로 확인 방법
// 데이터 있을 경우와 없을 경우
switch constantNum1{
case .none:
    print("The optional variable is null")
case .some(let value):
    print("Value is \(value)")
}

//-----------------
var constantNum2 : Int? = 100 // ?되어있는건 unwrap하고 사용
print(constantNum2! + 10)

switch constantNum2{
case .none:
    print("The optional variable is null")
case .some(let value):
    print("Value is \(value)")
}

//-----------------
// if let 방식
// 에러 안걸리고 하는 방식
var myName2: String? = "James"
var myName: String? = nil
if let name: String = myName2, let friend = myName{
    print("\(name) and \(friend)")
}else{
    print("nil")
}

myName = "Cathy"
if let name: String = myName2, let friend = myName{
    print("\(name) and \(friend)")
}else{
    print("nil")
}
