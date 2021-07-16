//
//  main.swift
//  Day03
//
//  Created by SeungYeon on 2021/07/16.
//

import Foundation

// Dictionary
// key와 Value로 구성됨

//var sccoreDictionary: Dictionary<String, Int> = [String: Int]()
var scoreDictionary: [String: Int] = [:]
scoreDictionary["유비"] = 100
scoreDictionary["관우"] = 90
scoreDictionary["장비"] = 80

print(scoreDictionary)

// 초기값을 가지는 Dictionary
let initailizedDictionaly: [String: String] = ["name":"James", "gender":"mali"]


// Set
// Set은 집합연산에 사용되고, 중복 데이터를 적용하지 않는다.

let oddDigits: Set = [1,3,5,7,9]
print(oddDigits)

let oddDigits1: Set = [1,3,5,7,9,9,9,9,9,9,9,9,9]
print(oddDigits1)

let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNnmbers: Set = [2,3,5,7]

// 합집합
print(oddDigits.union(evenDigits).sorted())

// 교집합
print(oddDigits.intersection(evenDigits).sorted())

// 차집합
print(oddDigits.subtracting(singleDigitPrimeNnmbers).sorted())

// Set의 동등 비교
let houseAimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
let cityAnimals: Set = ["duck", "rabbit"]

// 부분집합
print(houseAimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAimals))
print(farmAnimals.isDisjoint(with: cityAnimals))


print("==========================================")

// If => (, == &&)
var isCar = true
var isNew = true

if isCar, isNew{
    print("New Car")
}

isNew = false

if isCar, isNew{
    print("New Car")
}else{
    print("Old Car")
}

print("=========================================")

// Switch 조건문
// Before Switch
// if문 잘 안써 이게 잘되어 있어서

let personAge = 14
if personAge < 1{
    print("baby")
}else if personAge < 3 {
    print("toddler")
}else if personAge < 5 {
    print("preschooler")
}else if personAge < 13 {
    print("gradeschooler")
}else if personAge < 18 {
    print("teen")
}else{
    print("adult")
}

// After using Switch statement
switch personAge{
case 0..<1:
    print("baby")
case 1..<3:
    print("toddler")
case 3..<5:
    print("preschooler")
case 5..<13:
    print("gradeschooler")
case 13..<18:
    print("teen")
default:
    print("adult")
}

let someInteger = 123456

switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 101...Int.max:
    print("over 100")
default:
    print("unKnown")
}

print(Int.max)

let aCharacter: Character = "a"

switch aCharacter{
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}


// 국어, 영어, 수학 점수로 총점 평균을 구하고 등급을 정하기

let name = "유비"
let kor = 91
let eng = 97
let math = 95

var tot = 0
var avg: Double = 0

tot = kor + eng + math
avg = 80

// 점수 등급 출력 - 1
var grade: String

// if문을 이용한 등급 출력
if avg >= 90{
    print("A")
}else if avg >= 80 {
    print("B")
}else if avg >= 70{
    print("C")
}else{
    print("F")
}


// switch case문을 이용한 등급 출력
switch avg{
case 90..<100:
    print("A")
case 80..<90:
    print("B")
case 70..<80:
    print("C")
default:
    print("F")
}


// 삼항연산자 등급 출력
grade = avg >= 90 ? "A" : avg >= 80 ? "B" : avg >= 70 ? "C" : "F"
print(grade)

var score = [0.0, 70.0, 80.0, 90.0]
var level = ["F", "C", "B", "A"]

for i in 0..<score.count{
    if avg <= score[i]{
        print("\(level[i])")
        break
    }
}

// 반복문
let names = ["Anna", "Alex", "Brian", "Jack"]

for i in 0..<name.count{
    print(names[i])
}

for name in names{
    print(name)
}

// dictionary 반복문
let numberogLegs = ["Spider":8, "Ant":6, "Cat":4]

for (animalName, LegCount) in numberogLegs{
    print("\(animalName) have \(LegCount) legs")
}

let seq1 = 1...5
for i in seq1{
    print("\(i) * 5 = \(i*5)")
}

for i in seq1.reversed(){
    print("\(i) * 5 = \(i*5)")
}

let minutes = 60
let hourInterval = 5
for tickMark in stride(from: 0, to: minutes, by: hourInterval){
    print(tickMark)
}

for tickMark in stride(from: 0, to: minutes, by: hourInterval){
    print(tickMark)
}

// while
var startIndex = 0
var endIndex = 100
var sum = 0

while startIndex <= endIndex{
    sum += startIndex
    startIndex += 1
}

print(sum)

// 1부터 100까지의 짝수의 합 ( 단, if문 사용금지)
var startIndex1 = 1
var endIndex1 = 100
var sum1 = 0

while startIndex1+1 <= endIndex1{
    sum1 += startIndex1
    startIndex1 += 2
}
print(sum1)


//


print("Enter an integer(0~9)",terminator:" : ")
var a: Int = Int(readLine()!)!
var total: Int = 0
while a > 0{
    total += a % 10
    a /= 10
}
print("Sum of digits = \(a)")

//
print("Enter an integer(0~9)",terminator:" : ")
var inpNum = Int(readLine()!)

var repNum = 0
var remainder = 0
var sumNo = 0

if let _: Int = inpNum{
    repNum = inpNum!
    while repNum != 0{
        remainder = repNum % 10
        sumNo += remainder
        repNum /= 10
    }
    print("Sum of digits = \(sumNo)")
}else{
    print("Input value is weong!")
}
