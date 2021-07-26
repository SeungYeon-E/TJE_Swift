//
//  main.swift
//  Day04
//
//  Created by SeungYeon on 2021/07/19.
//

import Foundation

// 함수 : JAVA의 Method와 같다

func interSum(a: Int, b: Int) -> Int{
    return a + b
}

print(interSum(a: 5, b: 8))

func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func sayHelloWorld() -> String {
    return "Hello, World!"
}

print(sayHelloWorld())

func buildAddress(_ name: String, address: String, city: String, 우편번호 zipCode: String, country: String? = "USA") -> String {
    return """
        \(name)
        \(address)
        \(city)
        \(zipCode)
        \(country ?? "")
        """
}

print(buildAddress("유비", address: "중국", city: "상하이", 우편번호: "123", country: "China"))
print(buildAddress("장비", address: "중국", city: "북경", 우편번호: "234"))
print(buildAddress("장비", address: "중국", city: "북경", 우편번호: "234", country: nil))

// 가변 매개변수
func sayHelloFriends(me: String, friend: String...) -> String {
    return "Hello \(friend)! I'm \(me)"
}

print(sayHelloFriends(me: "초선", friend: "손견", "손책", "장양"))

// 복수의 값을 반환하는 함수
func getCountry() -> (dialCode: Int, isoCode: String, name: String) {
    let country01 = (dialCode: 82, isoCode: "KR", name: "Korea")
    return country01
}

let ret = getCountry()
print(ret)
print(ret.dialCode)

// 시작 숫자부터 끝 숫자까지의 합계를 구하는 함수
// 1) for문
func addRange01(start: Int, end: Int) -> String {
    var sum : Int = 0
    for i in start...end{
        sum += i
    }
    return "\(start)부터 \(end) 까지의 합은 \(sum)"
}

// 2) while문
func addRange02(start: Int, end: Int) -> String {
    var sum : Int = 0
    var i : Int = start
    while i <= end{
        sum += i
        i += 1
    }
    return "\(start)부터 \(end) 까지의 합은 \(sum)"
}

print("\(addRange01(start:1, end:100))")
print("\(addRange02(start:1, end:100))")

// Overloading : 함수의 이름은 중복되도 parameter의 갯수로 구분이 가능

// 도형의 면적과 둘레를 구하는 함수
// 원
func shape(_ r: Double) {
    let pi = 3.14
    let area = pi * r * r
    let border = 2 * pi * r
    print("원 : \(area), \(border)")
}

// 직사각형
func shape(_ w: Int, _ h:Int) {
    let area = w * h
    let border = (w + h) * 2
    print("직사각형 : \(area), \(border)")
}

// 직각 삼각형
func shape(_ w: Int, _ h: Int, _ r: Int) {
    let area = (w * h) / 2
    let border = w + h + r
    print("직각 삼각형 : \(area), \(border)")
}

shape(5)
shape(5, 6)
shape(5, 6, 7)

/*
 Class : 전통적인 OOP관점에서의 클래스
 - 단일 상속
 - property
 - constructor
 - method
 - 참조 타입 선언(Call by reference)
 ** 클래스는 복제해서 쓰면 똑같은 값을 가지니 주의
 
 Struct
 - 상속 불가
 - property
 - constructor
 - method
 - 값 타입 선언(Call by value)
 
 */

// Class와 Struct의 비교
struct ValueType {
    var property = 1
}

class ReferenceType{
    var property = 1
}

let firstStructInstance: ValueType = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first: \(firstStructInstance.property)")
print("second: \(secondStructInstance.property)")

let firstClassInstance: ReferenceType = ReferenceType()
var secondClassInstance = firstClassInstance
secondClassInstance.property = 2

print("first: \(firstClassInstance.property)")
print("second: \(secondClassInstance.property)")
