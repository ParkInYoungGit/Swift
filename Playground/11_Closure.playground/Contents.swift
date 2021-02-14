import Cocoa


/*
 Closure와 함수의 비교
 함수는 이름이 있는 closure
 
 first-citizen(일급 시민)
변수, 상수 등으로 저장, 전달인자로 전달이 가능
함수는 이름이 있는 Closure다

- 함수보다 먼저 만들어진 것
- 써도 되고 안써도 되는 것
- 파이썬의 Lambda 함수와 비슷하다.
- alert 띄울 때 무조건 써야하는 것
- 기능이 있는 변수
 */


// -----------------------------
// Closure와 함수의 비교
// -----------------------------
// 함수
func sumFunction(a: Int, b: Int) -> Int{
    return(a + b)
}

var sumResult: Int = sumFunction(a: 50, b: 20)
print(sumResult)

// -----------------------------
// Closure
// app alert 기능에 많이 쓰인다.
var sumClosure : (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sumClosure(10, 20)
print(sumResult)


// ------------------------------
// Closure 와 함수 사용하기
// 함수에다가 + - * / 만든다.

let add: (Int,Int) -> Int = {(a:Int, b:Int) -> Int in return a+b}
let subtract: (Int,Int) -> Int = {(a:Int, b:Int) -> Int in return a-b}
let multiply: (Int,Int) -> Int = {(a:Int, b:Int) -> Int in return a*b}
let divide: (Int,Int) -> Int = {(a:Int, b:Int) -> Int in return a/b}

                            // method는 closure에 쓰려고 맞춤 /method:(Int, Int) -> Int)/
func calculate(a:Int, b:Int, method:(Int, Int) -> Int) -> Int {return method(a,b)}

var calculated: Int, num1: Int = 60, num2:Int = 40
calculated = calculate(a: num1, b: num2, method:add)
print(calculated)  // 함수는 컨트롤러, 계산은 closure가 한다.

// Guard

func divide0(number: Int) {
    if number == 0 {
        print("0으로 나눌 수 없습니다.")
    }else{
        let result = 100/number
        print(result)
    }
}

divide0(number: 0)
divide0(number: 10)

func divide1(number: Int){
    guard number != 0 else {            //조건에 만족하면 바깥으로 빠져 나감
        print("0으로 나눌 수 없습니다.")
        return
    }
    let result = 100/number
    print(result)
}

divide1(number: 0)
divide1(number: 100)

func doubleValue1(input: Int?) -> Int?{
    if let i = input{
        return i * 2
    }
    return nil
}

print(doubleValue1(input: 4)!)

func doubleValue2(input: Int?) -> Int?{
    guard let i = input else{return nil}
    return i * 2
}
print(doubleValue2(input: 4)!)

/*
 Extension
 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있다.
 */
// Int에 extension을 적용하여 perperty 추가

extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

1.isEven
var number: Int = 3
number.isEven


extension Int{
    func multiply(by n: Int) -> Int{
        return self * n
    }
}

3.multiply(by: 2)
