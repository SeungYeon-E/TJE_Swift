//
//  main.swift
//  Day05
//
//  Created by SeungYeon on 2021/07/20.
//

import Foundation

// ---------
// 구조체 : Structure
// : Swift에서 Data Type을 정의

struct Sample {
    var sampleProperty: Int = 10 // 가변 프로퍼티
    let fixedSampleProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty: Int = 1000 // 타입 프로퍼티
    
    func instanceMethod() {
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method")
    }
}


// Structure 사용

// 변경가능
var samp = Sample()
print(samp.sampleProperty)
samp.sampleProperty = 100
print(samp.sampleProperty)
// 변경불가
var samp1 = Sample()
print(samp1.sampleProperty)

// Type Property
Sample.typeMethod()
print(Sample.typeProperty)

// 학생 구조체
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce() {
//        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()

var  student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

let cathy: Student = Student()
//cathy.name = "Cathy"
cathy.selfIntroduce()


// 학생 구조체
struct Student1 {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce() {
//        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student1.selfIntroduce()
var student1: Student1 = Student1()

// ---------------
class Shape{
    func input(_ r: Double) {
        let pi = 3.14
        let area = pi * r * r
        let border = 2 * pi * r
        print("원 : \(area), \(border)")
    }

    // 직사각형
    func input(_ w: Int, _ h:Int) {
        let area = w * h
        let border = (w + h) * 2
        print("직사각형 : \(area), \(border)")
    }

    // 직각 삼각형
    func input(_ w: Int, _ h: Int, _ r: Int) {
        let area = (w * h) / 2
        let border = w + h + r
        print("직각 삼각형 : \(area), \(border)")
    }
}

let sh1: Shape = Shape()
let sh2: Shape = Shape()
let sh3: Shape = Shape()

sh1.input(5) // 원의 면적과 둘레 구하기
// 원의 면적은 __이고 둘레는 __입니다.
sh2.input(5, 6) // 직사각형의 면적과 둘레 구하기
sh3.input(5, 6, 8) // 직각삼각형의 면적과 둘레 구하기

class Shape1{
    var area = 0.0
    let pi = 3.14157
    
    init(){
        print("계산시작")
        
    }
    init(redius: Double){
        area = redius * redius * pi
        calc()
        
    }
    init(w: Double, h: Double){
        let area = w * h
        let border = (w + h) * 2
        print("직사각형 : \(area), \(border)")
        
    }
    init(w: Double, h: Double, r: Double){
        let area = (w * h) / 2
        let border = w + h + r
        print("직각 삼각형 : \(area), \(border)")
        
    }
    func input(r: Double) {
        area = r * r * pi
        calc()
    }
    func calc() {
        print("원의 면적은 \(Int(area))입니다.")
    }
}

let sh4: Shape1 = Shape1()
sh4.input(r: 5.0)
let sh5: Shape1 = Shape1(redius: 5.0)

let sh6: Shape1 = Shape1(w: 5, h: 6) // 직사각형의 면적과 둘레 구하기
let sh7: Shape1 = Shape1(w: 5, h: 6, r: 8) // 직각삼각형의 면적과 둘레 구하기

// Extention
// 구조체, 클래스, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능.
// 기존에 존재하는 기능은 재정의 할 수 없다.
// 확장할수있다.
extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven)


// Closure

//함수

func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 10, b: 20)
print(sumResult)


// Closure
var sumClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sumClosure(10, 20)
print(sumResult)

// ----
print(Int.random(in: 1..<10))
print(Int.random(in: 1..<10))

func genNum() -> String {
    return String(Int.random(in: 1..<10))
}

print(genNum())
print(genNum())
print(genNum())
