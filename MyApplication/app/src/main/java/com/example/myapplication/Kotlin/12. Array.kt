package com.example.myapplication.Kotlin

//12. 배열

//배열이 필요한 이유
// - 그룹(모음집)이 필요할 때
//is가 Array이면 true, false
fun main(array: Array<String>){

    //배열을 생성하는 법(1)
    var nubmer : Int = 1 //변수 선언(존재를 알리는 것) number라는 변수에 1를 넣어서 선언해주는 것
    //생성(없던 것을 내가 만들어서 이 변수에 담았다.) 일단 선언 == 생성
    var group1 = arrayOf<Int>(1,2,3,4,5)
    println(group1 is Array) //group1이 Array이면 true, 아니면 false

    //배열을 생성하는 법(2)
    var number1 = 10
    var group2 = arrayOf(1,2,3.5,"Hello") //여러개의 타입 같이 사용하는 것 비추

    //Index 란
    // ->순서(번째)
    //[1,2,3,4,5]
    // "0"부터 시작
    //index 0 -> 1, index 1 ->2

    //배열의 값을 꺼내는 방법
    val test1 = group1.get(0)
    val test2 = group1.get(4)
    println(test1)
    println(test2)

    //배열의 값을 꺼내는 방법(2)
    val test3 = group1[0]
    println(test3)

    //배열의 값을 바꾸는 방법(1) 수정
    group1.set(0,100)
    println(group1[0])

    //배열의 값을 바꾸는 방법(2) 수정
    group1[0] = 200
    println(group1[0])
}