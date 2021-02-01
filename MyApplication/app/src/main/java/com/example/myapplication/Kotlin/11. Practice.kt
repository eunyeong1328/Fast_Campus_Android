package com.example.myapplication.Kotlin

//11. 제어흐름 실습
//when 구문의 조건으로 갖는 값의 모든 경우에 대응 해주는 것이 좋다.
//when의 다양한 조건식(1) is Int, (2) in 60..70
fun main(args:Array<String>){
    val value: Int? = null

    when(value){
        null -> println("value is null")
        else -> println("value is not null")
    }

    val value2: Boolean? = null

    //when 구문은 조건으로 갖는 값의 모든 경우에 대응 해주는 것이 좋다.
    when(value2){ //when의 모든 경우의 수를 적어주기
        true -> {
            println("")
        }
        false -> {
            println("")
        }
        null -> {
            println(" ")
        }
    }

    //값을 리턴하 는 if문 사용시 반드시 그 값을 리턴해주는 값이 있어야 한다.
    val value3 = when (value2) {
            true -> 1
            false -> 3
            null ->10
    }

    //when의 다양한 조건식 (1) 반드시 true,false를 리턴
    val value4: Int = 10
    when(value4){ //when에서 조건을 적는 경우는 3가지가 올 수 있는데
            //1. true,false가 올 수 있는 연산들
            //2. else // 3. null
        is Int -> { //value4 가 Int타입이냐??
            println("value4 is Int")
        }
        else -> {
            println("value4 is not int")
        }
    }

    //when의 다양한 조건식(2) 60과 70
    val value5: Int = 67
    when(value5){
        in 60..70 ->{ //60~70 70을 사용할 수 있는지
            println("value is in 60-70")//60~70사이에 있으면 true, 아니면 false
        }
        in 70..80 -> {
            println("value is in 70-80")
        }
        in 80..90 ->{
            println("value is in 89-90")
        }
    }

}