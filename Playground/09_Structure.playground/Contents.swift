import UIKit

/* 구조체 : Structure
 구조체는 Swift에서 Type을 정의한다. (java bean 하고 비슷)

 property and method
 구성은 class와 동일...
 */

struct Sample {
    var sampleProperty: Int = 10
    let fixedSampleProperty: Int = 100
    static var typeProperty: Int = 1000
    
    func instanceMethod() {
        print("instance method")
    }
    
    static func typeMethod() {
        print("type method")
    }
}

// 구조체 사용
var samp: Sample = Sample()
samp.sampleProperty
samp.sampleProperty = 100
samp.sampleProperty
samp.fixedSampleProperty
// samp.fixedSampleProperty = 1000 let으로 만들었기 때문에 값 변경 불가능

Sample.typeProperty
Sample.typeMethod()

// 학생 구조체
struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }

    func selfIntroduce() {
        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.") // self 자바에서 this
    }
}

Student.selfIntroduce()

var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

let cathy: Student = Student()
cathy.selfIntroduce()

//---------------------------------

/*
 Class
 구조체는 값 타입인 반면 클래스는 참조 타입 call by reference
 */

class SampleC{
    var sampProperty: Int = 10
    let fixedSampProperty: Int = 100
    static var typeProperty: Int = 100
    
    func instanceMethod() {
        print("instance method")
    }
    static func typeMethod(){
        print("type method - static")
    }
    
    class func classMethod() {
        print("type method - class")
    }
}

// instance
var sampC: SampleC = SampleC()
sampC.sampProperty = 200
sampC.sampProperty

let sampC2: SampleC = SampleC()
sampC2.sampProperty = 500
sampC.sampProperty
sampC2.sampProperty

sampC = sampC2
sampC.sampProperty
sampC2.sampProperty

// 학생 클래스
class StudentC{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    class func selfIntroduce(){
        print("학생 타입 입니다.")
    }

    func selfIntroduce() {
        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.") // self 자바에서 this
    }
}

StudentC.selfIntroduce()
var studentC1: StudentC = StudentC()
studentC1.name = "James"
studentC1.class = "스위프트"
studentC1.selfIntroduce()

let cathyC:StudentC = StudentC()
cathyC.name = "Cathy"
cathyC.selfIntroduce()


// Class와 Struct의 비교

struct ValueType{
    var property = 1
}

class ReferenceType{
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2
firstStructInstance.property
secondStructInstance.property
