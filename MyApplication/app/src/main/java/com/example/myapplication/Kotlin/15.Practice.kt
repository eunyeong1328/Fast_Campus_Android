package com.example.myapplication.Kotlin
//자동완성 a.~~
fun main(array: Array<String>) { //인자이름 :배열<타입>
    val a = mutableListOf<Int>(1, 2, 3)
    a.add(4) //index를 생략할 수 있는 이유는 index의 맨 뒤에 넣는다는 의미이다.
    println(a)
    a.add(0, 100) //추가
    println(a)
    a.set(0, 200) //변경
    println(a)
    a.removeAt(1) //삭제
    println(a)

    val b = mutableSetOf<Int>(1, 2, 3, 4)
    println()
    b.add(2) //애당초 index가 없기 때문에 넣어줄 필요가 없는 것이다.
    println(b)
    b.remove(2)
    println(b)
    b.remove(100)
    println()

    val c = mutableMapOf<String, Int>("one" to 1)
    println()
    c.put("two",2) //추가
    println(c)
    c.replace("two",3) //교체 (빨간색)이 있는 이유는?안드로이드 24부터 만들 수 있다.
    println(c)
    println(c.keys)
    println(c.values)
    c.clear() //전체 삭제
    println(c)

}