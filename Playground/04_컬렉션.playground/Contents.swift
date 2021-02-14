import UIKit

/*
 컬렉션(Collection) : 여러 값들을 묶어서 하나의 변수로 사용
 
 Array : 순서가 있는 리스트 컬렉션
 Dictionary : 키와 값(Value) 의 쌍으로 이루어진 컬렉션
 Set(집합) : 순서가 없고 멤버가 유일한 컬렉션, 집합 연산
 */

// Array
// 빈 Int Array 생성
// <> 제네릭
var intVariable: Array<Int> = Array<Int>()
intVariable.append(1)
intVariable.append(10)
intVariable.append(100)
//intVariable.append(100.1)

print(intVariable)
print(intVariable.contains(100)) // 무슨 값이 들어있는지 확인
print(intVariable.contains(99))

print(intVariable[0])
print(intVariable[0...2])

// 처음 배열 삭제 (지우면 앞으로 땡겨진다)
intVariable.remove(at: 0)
print(intVariable)
// 마지막 배열 삭제
intVariable.removeLast()
print(intVariable)
// 전체 삭제
intVariable.removeAll()
print(intVariable)

//갯수
print("count of integers:", intVariable.count)
//print(intVariable[0])


// 여러가지 Array 선언 방법
// Array<Double> = [Double]
// 빈 Double Array 생성
var doubleArray  : Array<Double> = Array<Double>()
var doubleArray1 : Array<Double> = [Double]()
var doubleArray2 : [Double] = [Double]()
var doubleArray3 : [Double] = []   // (famous rule for making arra) 이걸 가장 많이 쓴다. 더블 대신 스트링, 인트등 변화를 주면 된다.
var intVariable2 : [Int] = []
var intVariable4 = [Int]()

// 배열에 초기값을 넣어 생성하기
let intVariable1 = [1,2,3]
let intVariable3 = [1,2,3]

// intVariable1.removeAll() //let은 자바에서 말하는 배열이다. let은 안지워진다.

// 빈 배열을 생성
var someInts  = [Int]()
//var someInts1 = [] //인트인지, 더블인지 알 수 없어서 에러가 발생한다.
print("somInts is of type [Int] with \(someInts.count) itmes")
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items")
someInts = [] // 배열 지우기
print("someInts is of type [Int] with \(someInts.count) items")


// 스위프트로 빅데이터로 분석가능하다.  python으로 분석할때 다른 사람 줄 때는 소스를 줘야한다. R도 마찬가지
// 스위프트는 실행 파일만 주면 된다.

// 기본값으로 설정된 배열 생성하기
var threeDouble = Array(repeating: 0.0, count: 10)  // 배열 10개가 생성된다.
print(threeDouble)

var anotherDoubles = Array(repeating: 2.5, count: 10)
print(anotherDoubles)

// 배열 합치기
var tenDoubles = threeDouble + anotherDoubles
print(tenDoubles)

// 문자를 이용한 배열의 생성
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList

// 문자열 배열의 출력
// 1type
for list in shoppingList{
    print(list)
}

// 2type
for i in 0..<shoppingList.count{
    print(shoppingList[i])
}

// 배열에 데이터 추가
shoppingList.append("Four")
print(shoppingList.count, shoppingList)

shoppingList += ["Baking", "Powder"]
print(shoppingList.count, shoppingList)

shoppingList += ["Chocolate", "Cheese","Butter"]
print(shoppingList.count, shoppingList)

var stringVariable = Array(repeating: true, count: 10) // "true" 문자 , "" (X) 없는게 Int true 잘 판단해서 사용하기
print(stringVariable)

// 배열의 특정 위치 데이터 변경 및 삭제
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList.count, shoppingList)

shoppingList[0...1]
print(shoppingList)
shoppingList[shoppingList.startIndex]
shoppingList[shoppingList.index(before: shoppingList.endIndex)]
shoppingList.first
shoppingList.last

// 배열의 특정 위치 데이터추가, 삭제, 변경
shoppingList.insert(("Maple Syrup"), at: 0)
print(shoppingList.count, shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)
print(mapleSyrup, shoppingList.count, shoppingList)

// shopplingList가 비어 있는지 확인
// 비어 있으면 The shopping list is empty.
// 아니면 The shopping list is not empty.
if shoppingList.isEmpty{
    print("The shopping list is empty")
}else{
    print("The shopping list is not empty")
}

// 배열의 값과 인덱스가 필요한 경우
for (index, value) in shoppingList.enumerated(){
    print("Item \(index + 1) : \(value)")
}

// Dictionary
// key가 String이고 value 가 String인 빈 Dictionary생성
// var stringDictionary: Dictionary<String, String> = [String:String]()  // [:] 는 비어있다는 표시
var stringDictionary: [String: String] = [:]

stringDictionary["name"] = "유비"
print(stringDictionary)
stringDictionary["name1"] = "관우"
stringDictionary["name2"] = "장비"
stringDictionary["a"] = "초선"
print(stringDictionary)
print(stringDictionary["name"]!)   //Optional을 없애기 위한 방법 ! 느낌표가 뜨고 난 뒤 optional없어짐

// key가 String이고 value가 Int 인 빈 Dictionary 생성
// 유비 <- 100, 관우 <- 90, 장비 <- 80을 넣고 출력하기
// var scoreDictionary: Dictionary<String, Int> = [String:Int]()
var scoreDictionary: [String: Int] = [:]

scoreDictionary["유비"] = 100
scoreDictionary["관우"] = 90
scoreDictionary["장비"] = 80
print(scoreDictionary)

//key가 String이고 value가 Any인 빈 Dictionary 생성
//somekey <- "value", anotheKey <- 100

var anyDictionary: [String: Any] = [:]
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
// Any타입이라서 숫자, 문자 상관없음
print(anyDictionary)

// key에 해당하는 값 변경
anyDictionary["someKey"] = "dictionary"
print(anyDictionary)

// key에 해당하는 값 제거
anyDictionary.removeValue(forKey: "anotherKey")
print(anyDictionary)
anyDictionary["someKey"] = nil
print(anyDictionary)

//간편한 Dictionary 생성
let emptyDictionary : [String:String]=[:]
// 초기값을 갖는 Dictionary 생성
let initializedDictionary: [String:String] =
    ["name":"James","gender":"male"]

let someValue: String = initializedDictionary["name"]! // < 강제 unwarping
print(someValue)

// set

var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(100)
integerSet

integerSet.contains(1)
integerSet.contains(10)

integerSet.remove(100)
integerSet

// 배열 문자를 이용한 Set 생성
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres.count,favoriteGenres)

var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres1.count,favoriteGenres)

favoriteGenres.isEmpty

// 추가
favoriteGenres.insert("Jazz")
favoriteGenres

// 삭제
if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre) I'm over it.")
}else{
    print("I never much cared for that.")
}

// 숫자와 집합 계산할 때 유용하게 사용하는 Set

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigits: Set = [2,3,5,7]

// 합집합
oddDigits.union(evenDigits).sorted()

// 교집합
oddDigits.intersection(evenDigits)
oddDigits.intersection(singleDigits).sorted()

// 차집합
oddDigits.subtracting(singleDigits)

// 여집합
oddDigits.symmetricDifference(singleDigits).sorted()

// Set의 멤버십과 동등 비교

let houseAnimals: Set = ["dog","cat"]
let farmAnimals: Set = ["cow","chicken","sheep","dog","cat"]
let cityAnimals: Set = ["duck","rabbit"]

print(houseAnimals.isSubset(of: farmAnimals)) // 부분집합 true

print(farmAnimals.isSuperset(of: houseAnimals)) // 모집단 true
//아무 관계도 없음
print(farmAnimals.isDisjoint(with: cityAnimals)) // 서로소 집합 true
