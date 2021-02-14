import UIKit

// 튜플을 사용한 할당 연산자
let (x1, y1) = (1,2)
print (x1, y1)

var (x2, y2) = (3, "kim")
print(x2, y2)

//사칙 연산자
print(1 + 2)
print(3 - 2)
print(4 * 3)
print(10 / 3) // 정수 나눗셈
print(10.0 / 3.0)
print(9 % 4)  // 나머지 값


// 단항 음수 연산자
let one = 1
let minusOne = -one
let plusOne = -minusOne
print(one, minusOne, plusOne)

// 비교 연산자
1 == 1
2 != 1
1 > 2
1 >= 2
2 <= 1

let name = "world"
if name == "world"{
    print("Hello World!")
}else{
    print("I'm sorry \(name), but ....")
}

// 투플 비교
(1, "zebra") < (2, "apple") // 스위프트는 제일 앞에서 부터 판단한다. 왼쪽은 숫자에서 판단이 끝
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog") // 동등비교
("bird", -1) < ("purple" , 1) // 앞에가 같은 경우만 true가 나온다.
//("bird", false) < ("purple", true) // 둘은 비교 불가

// 일반 조건 연산자
// 스위프트는 가능하면 if문 안쓴다.
let contentHeight = 40
let hasHeader = true
let rowHeight: Int

if hasHeader {
    rowHeight = contentHeight + 50
}else {
    rowHeight = contentHeight + 20
}
print(rowHeight)

// 삼항 조건 연산자
// 객체지향 언어
let contentHeight1 = 40
let hasHeader1 = false
let rowHeight1 = contentHeight + (hasHeader1 ? 50 : 20) //앞이 true값 뒤가 false값
print(rowHeight1)

// NIL 병합 연산자              // ??= 풀이 / ? (nil), ? (위에 삼항연산자 nil값 숫자)
let defaualtColorName = "red"
var userDefinedColorName: String?  // 이 값의 default값은 nil이다 <- optional 변수
var colorNameToUSe = userDefinedColorName ?? defaualtColorName
print(colorNameToUSe)

userDefinedColorName = "green"
colorNameToUSe = userDefinedColorName ?? defaualtColorName
print(colorNameToUSe)

// 중요한 것
// 범위 연산자
// 닫힌 범위 연산자
for i in 1...10{
    print(i)
}
// 1부터 10까지의 합계를 구하시오
// 1 ~ 10 합계는 55 입니다.
var result :Int = 0

for i in 1...10 {
    result += i
}
print ("1~10의 합계\(result)")

// 1 X 5 = 5
//   :
// 5 X 5 = 25
for i in 1...5 {
    print("\(i) X 5 = \(i*5)")
}

// 반 닫힌 연산자
for i in 1..<10{
    print("5 X \(i) = \(i*5)")
}

// for문을 이용하여 인원번호와 이름 출력하기 (인원번호는 1번부터)
let names = ["Anna", "Alex", "Brian", "jack"]
var count1: Int = 0

for i in names {
   count1 += 1
    print("Person \(count1) is called \(i)")
}

for i in 0..<names.count{
    print("Person \(i+1) is called \(names[i])")
}
// Person 1 is called Anana

let a1 = [-1, -2, -3, 0, 1, 2, 3]
let b1 = a1[2...] // 자리 2번부터 끝까지  -1은 0이다. -2는 1이다.
print(b1)
print(b1.count)
print(a1[1])
print(b1[2]) //b1을 출력하고자 하면 a1의 길이와 순서에 맞추어야 출력됨.

for i in 2..<a1.count{
    print(b1[i])
}

let b2 = a1[...2]
let b3 = a1[..<2]

print(names)
// 단방향 범위
for name in names[2...]{
    print(name)
}

for name in names[...2]{
    print(name)
}

let range = ...5 // max가 5란 값
range.contains(7) // 7이란 숫자가 있냐
range.contains(2)
range.contains(-100)

// 논리 연산자

// 논리 부정 연산자
let allowedEntry = false
if !allowedEntry{
    print("Access Denied!")
}


// 논리 곱연산자
// && 둘다 ok 이면 통과
let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan{
    print("Welcome!")
}else{
    print("Access Denied!")
}

// 논리 합연산자
// || 둘중에 하나라도 ok 이면 통과
let hasDoorKey = false
let knowOverridePassword = true

if hasDoorKey || knowOverridePassword{
    print("Welcome!")
}else {
    print("Access Denied!")
}
