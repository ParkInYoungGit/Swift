import UIKit

/* Optional
- 값이 있을 수도 있고, 없으 수도 있음
- nil을 포함 할 수도 있고, 아닐 수 도 있다.
var constantNum = 100 */

//constantNum = nil //

let optionalConstant : Int! = nil  // 가져올 때 ! 쓴다.
let optionalConstant2: Int? = nil  // 선언할 때 ? 쓴다.

// Optaional 계산 1
var constantNum1: Int? = 100
print(constantNum1! + 10)

// Nil 값에 더하기는 안된다.
constantNum1 = nil
//print(constantNum1! +1)

// Nil값 switch로 확인 방법
// 데이터 있을 경우와 없을 경우
switch constantNum1{
case .none:
    print("The optional variable is null")
case .some(let value):
    print("Value is \(value)")
}

// if let 방식
// 에러 안걸리고 하는 방식
var myName: String? = nil
if let name: String = myName{
    print(name)
}else{
    print("nil")
}




var isCar = true
var isNew = true

if isCar, isNew{
    print("New Car~")
}

isNew = false
if isCar, isNew{
    print("New Car")
}else{
    print("Old Car")
}

// Unwrapping if문
let price: Double? = 5.99 //nil값을 수용하는 변수

// 강제적 Unwrapping
if price! > 5.0{
    print(price!)
}

// 조건형 Unwrapping
if let p = price, p > 5.0{
    print(p)
}

// Switch 조건문

let personAge = 14

if personAge < 1 {
    print("baby")
}else if personAge < 3{
    print("toddler")
}else if personAge < 13 {
    print("gradeschooler")
}else if personAge < 18 {
    print("teen")
}else{
    print("adult")
}

switch personAge {
case 0..<1: print("baby")
case 1..<3: print("toddler")
case 3..<5: print("preschooler")
case 5..<13: print("gradesschooler")
case 13..<18: print("teen")
default: print("adult")
}

let someInteger = 34
switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknow")
}

let character: Character = "a"
switch character {
case "a","A":
    print("The letter A")
default:
        print("Not the letter A")
}

//Tuple 사용하기
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin.")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case(-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside if the box")
}

// case에 where조건 사용하기
let anotherPoint = (1, -1)
switch anotherPoint {
case let(x, y) where x == y:
    print("\(x), \(y) is on the line x == y")
case let(x, y) where x == -y:
    print("\(x), \(y) is on the line x == -y")
default:
    <#code#>
}

let countryName = "United States"
var countryCode = ""

if countryName == "United Kingdom" {
    countryCode = "GB"
}else if countryName == "Mexico"{
    countryCode = "MX"
}else if countryName == "Canada"{
    countryCode = "CA"
}else if countryName == "Spain"{
    countryCode = "ES"
}else if countryName == "United States"{
    countryCode = "US"
}else{
    countryCode = "??"
}
print ("Country named '\(countryName)' has code \(countryCode)")

// 위의 소스를 enum과 switch로 사용
// 약자를 통해서 찾는 것
enum Countries: String {
    case uk = "United kingdom"
    case mx = "Mexico"
    case ca = "Canada"
    case es = "Spain"
    case us = "United States"
    case unknown = ""
}

// ?? null값이 들어올 경우 때문에 물음표 2개
switch Countries(rawValue: countryName) ?? .unknown {
case .uk: countryCode = "GB"
case .mx: countryCode = "MX"
case .ca: countryCode = "CA"
case .es: countryCode = "ES"
case .us: countryCode = "US"
case .unknown: countryCode = "??"
}
print ("Country named '\(countryName)' has code \(countryCode)")
