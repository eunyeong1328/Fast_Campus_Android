package com.example.myapplication.Kotlin
//코틀린
// 코틀린 언어가 가지고 있는 특징 == 개발자가 null에 대응할 수 있게 도와주는 언어
fun main(args:Array<String>){
    val a : Int? = null
    val b : Int = 10
    val c : Int = 100

    if(a == null){
        println("a is null")
    }else{
        println("a is not null")
    }

    if(b+c==110){
        println("b plus c is 110")
    }else{
        println("b plus c is not 110")
    }

    //앨비스 연산자 (?:) (자주 사용하면 하면 좋다.)
    val number: Int? = null
    val number2 = number ?: 10
    println()
    println(number2)

    val num1: Int = 10
    val num2: Int = 20

    //값을 리턴하는 if 사용방법
    val max = if(num1 > num2){
        num1 //10
    } else if(num1 == num2){
        num2 //20
    }else{ //그 외 모든 경우의 수에는 else문에서 처리된다.

    }
    println()
    println(max)


}