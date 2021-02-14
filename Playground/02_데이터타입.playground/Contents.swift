import UIKit

/*
 내 PC의 OS크기 알기
 */

print("Int   : \(String(Int.min)) ~ \(String(Int.max))")
print("Int8  : \(String(Int8.min)) ~ \(String(Int8.max))")
print("Int16 : \(String(Int16.min)) ~ \(String(Int16.max))")
print("Int32 : \(String(Int32.min)) ~ \(String(Int32.max))")
print("Int64 : \(String(Int64.min)) ~ \(String(Int64.max))")

/*
 기본 데이터 타입
 : Bool, Int, UInt, Float, Double, Character, String
 */

// Bool
var somBool: Bool = true
somBool = false

// Int
var someInt: Int = -100
someInt = Int(100.1)
someInt = 100_000
someInt = 100_00_00

// UInt (unsigned)
var someUInt: UInt = 100
//someUInt = -100
//someUInt = someInt 타입이 달라서 error

// Float
var someFloat: Float = 3.14
someFloat = 3
someFloat = 10_000.44_556
print(someFloat)

// Double
var someDouble: Double = 3.14
someDouble = 3
someDouble = 10_000.44_556
print(someDouble)

print("Printing \(type(of: someDouble)):\(type(of: someFloat)) " ) //타입 알아보기

// 숫자 Type 변환

let doubleNum = 4.999999
var castToInt = Int(doubleNum) //소수점 없애기
var roundToInt = Int(doubleNum.rounded()) //반올림

print("Origin :", doubleNum, "After Cast :",castToInt, "After Rounded :", roundToInt)

// character (한글자만)
var someCharacter: Character = "💕"
someCharacter = "가"
someCharacter = "a"
//someCharacter = "abcd"

// String
var someString: String = "하하하 💕"
someString = someString + "웃으면 복이와요"
someString += "나도 !"
print(someString)

//someString = someCharacter 타입이 달라서 error

someString = """
여러줄 문자열을
사용할 수 있습니다.
첫줄에 겹따옴표 3개,
마지막 줄에 겹따옴표 3개를
사용하면 됩니다.
"""
print(someString)

// 문자열과 특수문자
// \t, \n, \r, \", \'
print("aa\tbb\ncc")
let wiseWords = "\"Imagination is mor important than knouledge\" - Einstein"
print(wiseWords)

// Unicode
let dollaSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1f496}"
print(dollaSign, blackHeart, sparklingHeart)

// 빈 문자열 초기화
var emptyString = ""
var anotherEmptyString = String()

// 빈 문자열 확인
if emptyString.isEmpty {
    print("Nothing to see here !")
}

// 문자열의 개별 문자 출력
for chr in "Dog!🐶대한민국"{
    print(chr)
}

// 문자 상수 선언
let exclamationMark: Character = "!"

// 문자 배열을 이용한 문자열 출력
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
var catString1: String = String(catCharacters)
catString1.append(exclamationMark)

// ------
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5) "
print(message)
// "3 times 2.5 is 7.5"

// 문자 길이
let str = "12345.6789"
print("str has\(str.count) characters")

// 문자열 인덱스
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)] // 문자열의 맨 끝은 \n
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)  // 이부분에서 스위프트를 처음써본 개발자들이 많은 에러가 생긴다. 유의해서 사용하자
greeting[index]

//문자열의 개별 문자 접근
print(greeting)

for index in greeting{
    print(index)
}

//indices가 0번 부터 몇번까지 번호가 있다고 알려준다.
for index in greeting.indices{
    print("\(greeting[index])", terminator:",")//terminator 사용법 알아두기
}


// 문자의 삽입과 삭제
print()
var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
print(welcome1)

// a.문자 삽입
welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))
print(welcome1)

// b.문자 삭제
welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
print(welcome1)

//  시작 : 스위프트로 스크랩파이가 가능하다.
// 파이썬에서 비슷한거는 [1:6]
let range = welcome1.index(welcome1.endIndex,offsetBy: -6)..<welcome1.endIndex  // 범위 : 어디부터 어디까지..<welcome1.endIndex는 범위를 잡아주는거 많이쓴다. 알아두기
welcome1.removeSubrange(range)
print(welcome1)

// 부분 문자열    for 문 및 if문을 거의 사용하지 않고 돌리는 방법! 스위프트!
let greeting1 = "Hello, World"
let index1 = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
// ?? : nil을 허용하면서 앞의 조건값에 해당하는 것이 없으면 endIndex를 수용한다.
let beginning = greeting1[..<index1]
print(beginning)

//접두사와 접미사 비교
let romeoAndJuliet = [
    "Act 1 Scene 1 : Verona, A public place",
    "Act 1 Scene 2 : Capulet's mansion",
    "Act 1 Scene 3 : A room is Capulet's mansion",
    "Act 1 Scene 4 : A street outise Capulet's mansion",
    "Act 1 Scene 5 : the Greet Hall in Capulet's mansion",
    "Act 2 Scene 1 : Outside Capulet's mansion",
    "Act 2 Scene 2 : Capulet's orchard",
    "Act 2 Scene 3 : Outside Friar Lawrenece's cell",
    "Act 2 Scene 4 : A street in Verona",
    "Act 2 Scene 5 : Capulet's mansion",
    "Act 2 Scene 6 : Friar Lawrenece's cell"
]

var act1SceneCount = 0 //값 초기화
for scene in romeoAndJuliet{
    if scene.hasPrefix("Act 1 "){ //prefix(접두사) 는 True/ False값이다. "Act 1" 있는게 있나?
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scene in Act 1.")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet{
    if scene.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    }else if scene.hasSuffix("Friar Lawrenece's cell"){
        cellCount += 1
    }
}
print ("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 문자열중 끝 부분이 Capulet's mansion의 갯수와 Friar Lawrence's cell의 갯수 출력



// Any, AnyObject, nil
/*
 Any : Swift의 모든 타입을 지칭하는 키워드
 nil : null (없음을 의미하는 키워드
 */

// Any (숫자 , 문자 ) 둘다 가능
// 단점 : 메모리를 많이 사용한다.
var someAny: Any = 100

someAny = "어떤 타입도 수용 가능합니다."
someAny = 123.12

let someAny1:Double = someAny as! Double // !<- 강제형 변환
print(someAny1)

//someAny = nil (any타입도 nil 수용 못함)

// Tuple
// Tuple 사용전 선언 및 출력방법
var dialCode = 82
var isoCode = "KR"
var name = "Korea"

print(dialCode, isoCode, name)

// Tuple의 사용
// 스마트폰은 메모리를 신경써야한다!
// Xcode는 시뮬은 되지만 실제폰은 안될 수도 있다!
// 반드시 테스트해야 한다.
var country = (82, "KR", "Korea")
print(country.0,country.1,country.2)


var country1 = (dialCode1: 82, isoCode1: "KR", name1: "Korea")
print(country1.dialCode1)
print(country1.0)

/*
 person <- (John Doe, 201 Main Street, 35)
 John Doe lives at 201 Main Street and is 35 years old.
 */

let person1 = ("John Doe", "201 Main Street", 35)
print("\(person1.0) lives at \(person1.1) and is \(person1.2)years old")

// Type 별칭
// 기본 Type이든 사용자 Type 이든 별칭을 사용 할 수 있음

typealias MyInt = Int
typealias YoutInt = Int
typealias MyDouble = Double

let age: MyInt = 20
let year: YoutInt = 2020
//year = age
print(year)

var person = (name:"John Doe",address:"201 Main Street",age:"35")
print(person.name,"live at",person.address, "and is", person.age, "years old")
