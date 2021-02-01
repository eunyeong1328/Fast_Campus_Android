package com.example.myapplication.Kotlin

fun main(array: Array<String>){
    //산술 연산자(~한글 지원 안해줄 때 있으니까 참고하기)
    var a = 10+1
    var b = 10-1
    var c = 1*9
    var d = 20/3 //~ /나누기값
    var e = 20%3 //~ %나머지값

    println(a)
    println(b)
    println(c)
    println(d)
    println(e)

    //대입 연산자
    val f = 5

    //복합 대입 연산자
    a += 10
    b -= 10
    c *= 3
    d /= 4
    e %= 2

    println()
    println(a)
    println(b)
    println(c)
    println(d)
    println(e)

    //중감 연산자 직관적으로 더 사용하기 쉬울 수 있기 때문이다.
    a++ //~ a+=1
    b-- //~ b-=1
    println()
    println(a)
    println(b)

    //비교 연산자
    var g = a > b
    var h = a == b
    var i = !h //~ !(이 느낌표) boolean값에 대해서만 연산을 하게 된다. 정수,실수에 대해서는 사용불가(에러남)
    var l = i != h //~ l은 i와 h가 같지 않다면
    println(g)
    println(h)
    println(i)
    println(l)

    //논리 연산자
    val j = h && i //~ 둘다 true여야 true
    val k = h || i //~ 둘 중 하나만 true 여야 true
    println()
    println(j)
    println(k)
    println("이은영입니다.")
}