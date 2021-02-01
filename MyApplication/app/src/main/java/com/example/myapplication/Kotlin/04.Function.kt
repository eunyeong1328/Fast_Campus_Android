package com.example.myapplication.Kotlin

// 자동정렬 단축키 Ctrl + Alt + I

// 04. Function
// - 함수란
//      - 어떤 input 을 넣어주면 어떤 output 나오는 것
//      - y = x + 2

// - 함수를 선언하는 방법 (대체로 이렇게 선언한다.)
// fun 함수명 (변수명: 타입, 변수명:타입 ....) : 반환형 { //output의 타입을 적어주면 된다.
//     함수 내용
//     return 반환값
// }


//함수 선언
fun plus(first: Int, second: Int): Int{
    val result: Int = first + second
    return result
}

// - 디폴트 값을 갖는 함수 만들기
fun plusFive(first: Int, second: Int = 5): Int{
    val result: Int = first + second
    return result
}

//반환값이 없는 함수 만들기(1) - 아무것도 return하지 않겠다.
fun printPlus(first: Int, second: Int): Unit{// Unit이 회색인 이유는 생략이 가능하기 때문이다.
    val result: Int = first + second
    println(result)
}
//반환값이 없는 함수 만들기(2)
fun printPlus2(first: Int, second: Int){
    val result: Int = first + second
    println(result)
}

// - 간단하게 함수를 선언하는 방법 ◈◈◈
fun printShort(first: Int, second: Int) = first + second

// - 가변인자를 갖는 함수 선언하는 방법 / 1 ~ n 까지의 여러 개의 인자를 받을 수 있다.
fun plusMany(vararg numbers: Int){
    for(number in numbers){
        println(number)
    }
}

fun main(array: Array<String>){ //이 함수는 array라는 인자를 받는데 Array이라는 타입은 Array<String>이다.
    //함수를 호출하는 방법
    val result =  plus(5,10) //ctrl + p를 누르면 나온다
    println(result)
    //인수를 명시적으로 전달하는 방법
    val result2 = plus(first = 20, second = 30)
    println(result2)

    val result3 = plus(second = 100, first = 30)
    println(result3)

    //디폴트 값을 갖는 함수 호출하기
    println()
    val result4 = plusFive(10,20)
    println(result4)

    val result5 = plusFive(10)
    println(result5)

    println()
    printPlus(10,20)

    println()
    val result6 = printShort(50,50)
    println(result6)

    println()
    plusMany(1,2,3,4,5,6)
    plusMany(100)
}

