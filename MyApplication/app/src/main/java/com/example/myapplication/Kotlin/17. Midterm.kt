package com.example.myapplication.Kotlin

fun main(array: Array<String>){
    first()
    println(second(80))
    println(third(89))
    four()
}

fun first(){
    val list1 = MutableList(9,{0}) //사이즈, 초기값
    val list2 = MutableList(9, {true})

    for(i in 0..8){
        list1[i] = i + 1
    }
    for(i in 1..9){
        list1[i-1] = i
    }
    println(list2)
    list1.forEachIndexed{ index, value ->
        if(value % 2 == 0){
            list2[index] = true //짝수
        }else{
            list2[index] = false //홀수
        }
    }
    println(list1)
    println(list2)
}
//~~ 만약 return을 하면 second함수문 자체를 나가는데 result = "A"를 사용하면 when문만 나가게 된다.
fun second(score: Int) : String{
//    var result: String = "F"
    when(score){
        in 90..100 -> {
            //result = "A"
            return "A"
        }
        in 80..89 -> {
            return "B" //return을 했을 때 second라는 함수문을 나가게 된다.
        }
        in 70..79 -> {
            return "C"
        }
        else ->{
            return "F"
        }
    }
//    return result
}

fun third2(number: Int): Int{
    //89 -> 8+9
    val a: Int = number/10
    val b: Int = number%10
    return a+b
}

fun four(){
    for(x in 1..9){
        for(y in 1..9){
            println("$x x $y = ${x*y}") //$는 값을 가지고 오고 싶을 때 사용한다.
        }
    }
}