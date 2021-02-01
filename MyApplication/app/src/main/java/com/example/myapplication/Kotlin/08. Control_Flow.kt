package com.example.myapplication.Kotlin
//코틀린이 자바와 다른 점은? 간단한 코드는 중괄호를 줄여쓴다.

// 08. 제어 흐름
// - if, else
//흐름제어 , 값 리턴
//if를 사용시 조건의 결과값이 true나 false로 나와야 한다.
fun main(args:Array<String>){
    val a: Int = 5
    val b: Int = 10

    //if else 사용하는 방법(1)
    if(a>b){
        println("a가 b 보다 크다")
    }else{
        println("a가 b 보다 작다")
    }
    println("3번")

    // if/else 사용 하는 방법 (2)
    if (a > b) {
        println("a 가 b 보다 크다")
    }
    // if/else/else if 사용 하는 방법 (2)
    if (a > b) {
        println("a 가 b 보다 크다")
    } else if (a < b) {
        println("a 가 b 보다 작다")
    } else if (a == b) {
        println("a 와 b는 같다")
    } else {

    }

    //값을 리턴하는 if 사용방법
    val max = if(a>b){
        a //5
    } else{
        b //10
    }
    println()
    println(max)

    //값을 리턴하는 if 사용방법
    val max1 = if(a>b) a else b
    println()
    println(max1)

}