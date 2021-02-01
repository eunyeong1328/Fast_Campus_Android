package com.example.myapplication.Kotlin.`01`

//02. 자료형
//정수형 -> long > int > short > byte (표현할 수 있는 범위)
//실수형 -> Double > Float
//문자 -> Char (한자의 문자만 표현)
//문자열 -> String (여러자의 문자를 표현)
//논리형 -> (참True/거짓False) -> Boolean

//변수 선언하는 방법(1)
// Variable/Value 변수명 = 값
// var/val 변수명 = 값
var number = 10

//변수 선언하는 방법(2)
// var/val 변수 : 자료형 = 값
var number1 : Int = 20
var hello1 : String ="hello"
var point1 : Double = 3.4

//Variable or Value??
// - 1. 변하지 않는 값이라면 Value
// - 2. 진짜 모르겠다! -> Value

fun main(array: Array<String>){
    number = 20
//    number = 20.5
}