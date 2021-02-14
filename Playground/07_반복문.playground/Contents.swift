import UIKit

let names = ["Anna","Alex","Brian","Jack"]
for name in names{
    print("Hello, \(name)!")
}

for (index, text) in names.enumerated(){
    print("The name at index \(index) is \(text)")
}

//딕셔너리 사용 반복문
let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for(animalName, legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount)legs")
}

// 얼마만큼 증가하는가? 0 부터 60까지 5만큼 증가한다.
let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(tickMark)
}

let integerTodescribe = 5
var description = "The number \(integerTodescribe) is"

switch integerTodescribe {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also"
    fallthrough // 흘러가게 만든다
default:
    description += " an integer."
}
print (description)

// While
// 파이썬 코드 배열에 있는 걸 하나씩 줄어드는 것.
var integers = [1,2,3,4,5,6,7,8,9,10,11]
while integers.count > 1{
    integers.removeLast()
    print(integers)
}

// Label 문 2중 for문 시 break,continue 걸리면 무한루프 걸림 - > 해결
// 필요한 구문.

var startIndex1 = 0
var endIndex1 = 100
var sum1 = 0

gameLoop: while startIndex1 <= endIndex1{
    startIndex1 += 1
    sum1 += startIndex1
    if sum1 >= 50 {
        break gameLoop    // gameLoop 위치 지정해놓고 빠져나가는 위치를 정해줄 수 있다.
    }else{
        continue gameLoop // gameLoop 위치 지정해놓고 빠져나가는 위치를 정해줄 수 있다.
    }
}
print(sum1)

// 2개의 조건 형식
// 많이 쓰이는 형식
let price : [Double] = [1.99, 2.99, 3.99, 4.99, 5.99, 6.99, 7.99, 8.99, 9.99]
var total = 0.0
var i = 0
while i < price.count && price[i] < 7.0{
    i += 1
    total += price[i]
}
print("Total:", total, "Counts:",i)


// 위에 매소드를 좀더 다듬기

//String Formatter
// 많이 쓰이는 방식
print("Total:", String.init(format: "%2.f", total), "counts:", i)


//repeat
// 하나씩 지워짐
integers = [1,2,3]
repeat{
    print(integers)
    integers.removeLast()
}while integers.count > 0
