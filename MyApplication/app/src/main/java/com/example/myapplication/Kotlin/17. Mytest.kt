package com.example.myapplication.Kotlin

//1번 문제
//List를 두개 만든다.
//첫번째 List에는 0부터 9까지의 값을 넣는다(반복문 사용)
//두번째 Listd에는 첫번째 ArrayList의 값을 하나씩 확인한 후
//짝수면 True 홀수면 Flase를 넣어준다.

//2번 문제
//학점을 구하자
//80~90 -> A 70~79 -> B 60~69 -> C 나머지 F

//3번 문제
//전달 받은 숫자의 각 자리 숫의 합을 구하자
//조건 : 전달 받은 숫자는 무조건 두자리 숫자이다.

//4번 문제
//구구단을 출력하자

fun main(args:Array<String>){
    val a = mutableListOf<Int>(0,1,2,3,4,5,6,7,8,9)
    for(item in 1 until a.size){
        print("," + item)
    }
    println()
    for(item in 1 until a.size){
        if(item%2 == 0){
            print("true,")
        }else{
            print("false,")
        }
    }
    println()
    println("문제2")
    val result = grade(65)
    println("문제3")
    val result2 = third(89)
    println(result2)
    println("문제4")
    gugudan()
}

//학점 구하기
fun grade(score :Int){
    if(score>=80 && score<90){
        println("A")
    }else if(score>=70 && score<80){
        println("B")
    }else if(score>=60 && score<70){
        println("C")
    }else{
        println("F")
    }
}
fun third(value: Int): Int{
    var result :Int = value/10 + value%10
    return result
}

fun gugudan(){
    val a = intArrayOf(1,2,3,4,5,6,7,8,9)

    for(i in a){
        println()
        for(j in a){
            println(" " + i + "x" + j + "=" + i*j)
        }
    }
}