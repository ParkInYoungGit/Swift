//
//  main.swift
//  Ex01
//
//  Created by YOUNG on 2021/02/02.
//

/*
 Input your decimal no.!5
 *
 **
 ***
 ****
 *****
 ****
 ***
 **
 *
 */


import Foundation
/*
 별찍기
 */

print("Input your decimal no.!", terminator : "")
var inpNum = Int(readLine()!) //사용자로부터 입력받은 값 가져오기(다 문자로 가져옴) optional nil도 수용해주는 변수
var repNum = 0

if let _: Int = inpNum{
    repNum = inpNum!
    makeStar()
}else{
    print("Input value is wrong!")
}


func makeStar(){
    // 별표를 증가하면서 출력하기
    for lineNo in 1...repNum{
        for _ in 1...lineNo{
            print("*", terminator: "")
        }
        print("")
    }

    // 별표를 감소하면서 출력하기
    for lineNo in (0..<repNum - 1).reversed(){
        for _ in 0...lineNo{
            print("*", terminator: "")
        }
        print("")
    }
}



/*
 입력한 값 순서대로 곱하기
 */

print("Input your decimal no.!", terminator : "")
var inpNum1 = Int(readLine()!) //사용자로부터 입력받은 값 가져오기(다 문자로 가져옴) optional nil도 수용해주는 변수
var repNum1 = 0
var result = 1

if let _: Int = inpNum1{
    repNum1 = inpNum1!
    divNum()
}else{
    print("Input value is wrong!")
}

func divNum(){
    for i in (1...repNum1){
           result *= i
        }
    }
    print("\(repNum1)'s factorial value = \(result)")
    



/*
 입력한 값에서 +4까지 구구단 가로로 찍기
 */

print("Input your number :", terminator : "")
var inpNum2 = Int(readLine()!)
var repNum2 = 0

if let _: Int = inpNum2{
    repNum2 = inpNum2!
    gugudan()
}else{
    print("Input value is wrong!")
}

func gugudan(){
    for i in 1...9 {
        for j in repNum2...(repNum2+3){
            print("\(String(format: "%d", j)) X \(String(format: "%d", i)) = \(String(format: "%2d", i*j))    ",terminator:"")
                    }
                    print("")
    }
}


/*
 입력한 숫자 개별 합계 구하기
 */

print("Enter an integer :", terminator : "")
var inputNo = Int(readLine()!)
var repNo = 0
var total = 0

if let _: Int = inputNo{
    repNo = inputNo!
    integerSum()
}else{
    print("Input value is wrong!")
}


func integerSum(){
    while repNo != 0{
        total += repNo % 10
        repNo /= 10
    }
    print(total)
}

/*
 입력한 숫자를 더할지 입력 후 최대값 최소값 구하기
 */
var numMax = 0
var numMin = 100
var numMaxIndex = 0
var numMinIndex = 0
var num : [Int] = []

print("입력할 숫자의 갯수는? (100개 미만) :", terminator : "")
var insertNo = Int(readLine()!)

var repNo2 = 0


if let _: Int = insertNo{
    repNo2 = insertNo!
    print("\(repNo2)개의 숫자를 입력하세요")
    for _ in 1...repNo2{
        let number = Int(readLine()!)
        if let _: Int = number{
            num.append(_: number!)
        }else{
            print("Input value is wrong!")
        }
    }
        minMax()
}

func minMax(){
    for i in 0...repNo2{
        if num[i] > numMax {
            numMax = num[i]
            numMaxIndex = i+1
        }
        if num[i] < numMin {
            numMin = num[i]
            numMinIndex = i+1
        }
    }
    print("입력한 숫자의 최대값은 \(numMax)이고 \(numMaxIndex)번째 값입니다." )
    print("입력한 숫자의 최소값은 \(numMin)이고 \(numMinIndex)번째 값입니다." )
}

//    print("입력할 숫자의 갯수 ? (100개 미만) : ", terminator:"")
//    var inpNum5 = Int(readLine()!)
//    var repNum5 = 0
//    var inpNumbers = [Int]()
//    if let _: Int = inpNum5{
//        repNum5 = inpNum5!
//        print("\(repNum5)개의 숫자를 입력하세요!")
//        for _ in 1...repNum5 {
//            let number = Int(readLine()!)
//            if let _: Int = number{
//                inpNumbers.append(number!)
//
//            }else{
//                print("Input value is wrong!")
//            }
//
//        }
//        let result = makeSum(array: inpNumbers)
//        print("입력한 숫자 중 최대값은 \(result.max)이고 \(result.index+1)번째 값 입니다.")
//    }else{
//        print("Input value is wrong!")
//    }
//
//    func makeSum(array : [Int]) ->(index : Int, max : Int) {
//        var currentMax = array[0]
//        var count = 1
//        var returnNum = 0
//        for value in array[1..<array.count] {
//            if value>currentMax{
//                currentMax = value
//                returnNum = count
//            }
//            count += 1
//        }
//        return (returnNum, currentMax)
//    }



