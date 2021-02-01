package com.example.myapplication.Kotlin
//코틀린의 특징
//Variable: 값 변경 가능  / Value: 값 변경 불가능
//밑에는 값을 변경할 수 없는 Collection
//즉 값을 추가,빼기,변경 할 수 없다
//만들어 놓으면 처음부터 끝까지 사용해야 한다.

//14.Collection
// -> list, set, map

//List

fun main(args: Array<String>) {
    //Immutable Collections(값 변경 불가능) == value와 같음
    //List -> 중복 허용
    val numberList = listOf<Int>(1, 2, 3)
    println(numberList)
    println(numberList.get(0))
    println(numberList[0])

    //Set(집합)
    // -> 중복을 허용하지 않는다.
    // -> 순서가 없다!!
    val numberSet = setOf<Int>(1,2,3,3,3)
    println(numberSet) //ex[1,2,3]배열로 해서 출력
    numberSet.forEach{
        println(it) //하나씩 출력
    }//set의 전체 값 출력

    //Map -> key,value 방식으로 관리한다.
    val numberMap = mapOf<String, Int>("one" to 1, "two" to 2)
    println()
    println(numberMap.get("one"))



    //Mutable Collection (값 변경가능)
    val mNumberList = mutableListOf<Int>(1,2,3)
    mNumberList.add(3,4)
    println()
    println(mNumberList)

    val mNumberSet = mutableSetOf<Int>(1,2,3,4,4,4)
    mNumberList.add(10)
    println(mNumberList)

    val mNumberMap = mutableMapOf<String,Int>("one" to 1)
    mNumberMap.put("two",2)
    println(mNumberMap)
}