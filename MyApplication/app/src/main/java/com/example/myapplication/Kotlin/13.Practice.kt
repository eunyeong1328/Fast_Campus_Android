package com.example.myapplication.Kotlin
//명시적(읽었을 때 확 알 수 있는 것 == 눈으로 봤을 때 알 수 있는 것들)
//개발을 할 때 명시적으로 적을 수록 좋다.
//val array = arrayOf<Int>(1,2,3) //위보다
//val array = intArrayOf(1,2,3) //아래가 보기 좋다 (한눈에 보기 현함)

fun main(array: Array<String>) {
    val array = arrayOf<Int>(1, 2, 3)

    //get,set
    val number = array.get(0)
    println(number)
//    val number1 = array.get(100) //인덱스에 주의 해야 한다.

    array.set(0, 100)
    val number2 = array.get(0)
    println(number2)

//    array.set(100,100) //array가 가지고 있는 바운드를 벗어나는 index의 값을 할당

    // Array의 Bounds(사이즈)
    // - 처음 만들 때 결정 된다.

    //Array를 만드는 방법(3)
    val a1 = intArrayOf(1, 2, 3) //int받을 수 있는 Array가 따로 있다.
    val a2 = charArrayOf('b', 'b')//String은 ""(쌍따옴표)만 가능
    //char -> '', string -> ""
    val a3 = doubleArrayOf(1.2, 100.345)
    val a4 = booleanArrayOf(true, false, true)

    //Array를 만드는 방법(4) -> lambda를 활용한 방법 (알아두면 좋은 정도??더 깊게 알고 싶으면 구글링하기)
    var a5 = Array(10, {0}) //
    var a6 = Array(5,{1;2;3;4;5;})
    println()
    println(a6.get(0)) //사이즈
    println(a6[4])
}
