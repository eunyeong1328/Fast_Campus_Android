package com.example.myapplication.Kotlin

// 10 제어흐름
//흐름제어, 값 리턴
// When (이 때는 이거 저 때는 이거 실행)
//if를 사용시 조건의 결과값이 true나 false로 나와야 한다.
//하지만 when문에서는 반드시 결과값이 true나 false로 나오지 않아도 된다.


fun main(args: Array<String>){
    val value: Int = 3

    when(value){
        1-> {
            println("value is 1")
        }
        2-> {
            println("value is 2")
        }
        3-> {
            println("value is 3")
        }
        else -> {
            println("I do not know value")
        }
    }

    //중괄호가 짧으면 이렇게 사용 가능 (다만 처음에는 중괄호 사용하는 것이 좋다)
    //추천
    when(value){
        1-> println("value is 1")
        2-> println("value is 2")
        3-> println("value is 3")
        else -> println("I do not know value")
    }

    if(value == 1) println("value is 1")
    else if(value == 2) println("value is 2")
    else if(value == 3) println("value is 3")
    else println("I do not know value")

    val value2 = when(value){
        1->10
        2->20
        3->30
        else -> 100
    }
    println(value2)
}