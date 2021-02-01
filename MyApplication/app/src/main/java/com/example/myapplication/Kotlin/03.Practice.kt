package com.example.myapplication.Kotlin

var a = 1+2+3+4+5 // 연산의 결과값을 변수에 넣어 줄 수 있다.
var b = "1"
var c = b.toInt() //b를 문자로 바꾼 값
var d = b.toFloat()//1.0

var e = "John"
var f = "My name is $e Nice to meet tou"

// Null
// - 존재 하지 않는다.

//var abc : Int = null
// ?(물음표)를 붙여주면 null를 가질 수 있는 변수
var abc1: Int? = null //자료형에 ?를 붙여주면 null를 받을 수 있는 자료형이다. == null를 받을 수 있는 int형이 있다.
var abc2 : Double? = null //콘솔창에 null이 찍힌 것은 문자형이 아니라 그냥 null 그 자체이다.

var g = a+3
fun main(array: Array<String>){
    println(a)
    println(b)
    println(c)
    println(d)
    println(f)
    println(abc1)
    println(abc2)

    println(g)
}