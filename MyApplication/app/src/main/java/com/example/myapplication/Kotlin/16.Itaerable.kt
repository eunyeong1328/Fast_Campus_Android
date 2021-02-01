package com.example.myapplication.Kotlin

//16. Iterable(반복문)
//in(범위를 정해줄 때는 in을 사용한다.) / forEach{it(tiem) -> }
//downTo(index가 위부터 반복) / until (마지막 index를 포함하지 않는다.) / 0..10 (마지막을 포함한다.) / step은 2칸씩 반복
//while (조건의 결과값이 ture일 수록 계속 반복)
fun main(array: Array<String>){
    val a = mutableListOf<Int>(1,2,3,4,5,6,7,8,9)

    //반복하는 방법(1) 값만 알고 싶을 때
    for(item in a){ //범위를 정해줄 때는 in을 사용해준다.
        if(item == 5){
            println("item is Five")
        }else{
            println("item is not Five")
        }
    }
    println()

    //반복하는 방법(2) 인덱스도 알고 싶을 때
    for((index,item) in a.withIndex()){
        println("index : " + index + " value : "+ item)
        //문자열 + Int(정수) = 문자열
        //문자열 + 아무거나 = 문자열
    }
    println()
    //반복하는 방법(3)
    a.forEach{
        println(it) //이 람다함수는 forEach에 담겨서 들어온다.
    }
    println("item")
    //반복하는 방법(4)
    a.forEach{ item ->
        println(item)
    }
    //반복하는 방법(5)위에 ->"반복하는 방법(2)"과 동일하다
    a.forEachIndexed{index, item ->
        println("index : " + index + " value : "+ item)
    }

    //반복하는 방법(6)
    println(a.size)
    for(i in 0 until a.size){
        //until은 마지막을 포함하지 않는다.
        //0부터 8까지 이다
        println(a.get(i))
    }
    println()
    //반복하는 방법(7)
    for(i in 0 until a.size step (2)) { //2씩 증가 index는 0터 시작, 값의 index는 0부터 시작
        println(a.get(i))
    }
    println()
    //반복하는 방법(8)
    for(i in a.size - 1 downTo (0)){
        // 8부터 0까지 반복
        println(a.get(i))
    }
    println()
    //반복하는 방법(9)
    for(i in a.size - 1 downTo (0) step (2)){ //2칸씩 반복
        println(a.get(i)) //값 출력
    }
    println()
    //반복하는 방법(10)
    for(i in 0..a.size){
        println(i)
    }

    //반복한는 방법(11)
    var b: Int = 0 // -> 1 -> 2 -> 3
    var c: Int = 4

    while ( b < c){
        b++ //while문을 정지 시키기 위한 코드
        println("b")
    }

    //반복하는 방법(12)
    var d: Int = 0
    var e: Int = 4
    do{
        println("hello") //이건 무조건 한번은 실행된다.
        d++
    }while(d<e)


}