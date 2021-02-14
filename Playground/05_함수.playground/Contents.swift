import UIKit

// 함수 : function

func integerSum(a: Int, b: Int) -> Int{
    return a + b
} //int와 int를 받아서 int로 return

print(integerSum(a: 5, b: 5))



func greet(person: String)->String{
    return "Hello \(person)!"
}

print(greet (person: "Anna")) // Hello Anna!
print(greet (person: "Brian")) // Hello Brian!

// 파라미터가 없는 함수
func sayHelloWorld() -> String{
    return "Hello World!"
}
sayHelloWorld()

// 복수의 파라미터를 사용하는 함수
func greet1(person: String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted{
        return("Hello \(person), too")
    }else{
        return("Hello \(person)")
    }
}

greet1(person: "Tim", alreadyGreeted: true)
greet1(person: "Tim", alreadyGreeted: false)

// 초기값과 변수명을 없애는 함수
func buildAddress(_ name: String, address: String, city: String, zipCode postalCode: String, country: String? = "USA") -> String{
    return"""
        \(name)
        \(address)
        \(city)
        \(postalCode)
        \(country ?? "")
        """
}
//_ 변수명 안보이게, 이름두개쓰면 뒤에꺼 사용자가 쓰는거, String?= default값, ??"" nil값 들어왔을 때
print(buildAddress("John Doe", address: "5 Covington Square", city: "Birmingham", zipCode : "01234"))
print(buildAddress("John Doe1", address: "5 Covington Square", city: "Birmingham", zipCode : "01234", country: "Korea"))
print(buildAddress("John Doe1", address: "5 Covington Square", city: "Birmingham", zipCode : "01234", country: nil))

// 반환값이 없는 함수 void 생략가능
func printHello(name: String) -> Void {
    print("\(name)님! 안녕하세요")
}
printHello(name: "유비")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
printAndCount(string: "Hello World!")
print(printAndCount(string: "Hello World!"))

func printWithoutCounting (string: String) {
    let _ = printAndCount(string: string) //_ 변수 : return값 소멸
}
print(printAndCount(string: "Hello World!"))

print(printWithoutCounting(string: "Hello World!"))

// 가변 매개변수
func sayHelloToFriends(me: String, friends: String...)->String{
    return "Hello \(friends)! I'm \(me)"
}
print(sayHelloToFriends(me: "초선", friends: "손견", "손책","장양"))
print(sayHelloToFriends(me: "조조"))

// 복수의 값을 return 하는 함수
func getCountry() -> (dialCode: Int, isoCode: String, name: String) {
    let country = (dialCode: 82, isoCode: "KR", name: "Korea")
    return country
}
print(getCountry())

// 배열 중 최대값과 최소값을 return

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin{
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 171])
print("min is \(bounds.min) and max is \(bounds.max)")
