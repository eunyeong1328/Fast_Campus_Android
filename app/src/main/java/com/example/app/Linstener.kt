package com.example.app

import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
//위랑 아래가 완전히 동일하다!! 쓰면서 천천히 이해하깇ㅊㅊㅊㅊㅊ
class Linstener : AppCompatActivity() {

    var number = 10

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_linstener)

        // 뷰를 activity로 가져오는 방법
        // 1> 직접 찾아서 가져온다
        val hello : TextView = findViewById(R.id.hello)
        // 2> xml을 import해서 가져온다
        // 익명함수
        // 1 -> 람다 방식
        hello.setOnClickListener {
            Log.d("click", "Click!!")
        }
//2,3번은 찬찬히 이해하기
        // 2 -> 익명 함수 방식
        hello.setOnClickListener(object : View.OnClickListener {
            override fun onClick(v: View?) {
                Log.d("click", "Click!!")
            }
        })
//즉, hello에다(하나의 뷰에다가) Linstener를 3개를 달았음!!
        // 3개의 Linstener에서  가장 마지막에 적용된 것이 적용된다.
        // 3 -> 이름이 필요한 경우(click)
        val click = object : View.OnClickListener {
            override fun onClick(v: View?) {
                Log.d("click", "Click!!")
                hello.setText("안녕하세요") //클릭시 "안녕하세요" 라고 변함
                val image : ImageView = findViewById(R.id.image)
                image.setImageResource(R.drawable.c)
                number += 10
                Log.d("number", "" + number) //number를 클릭할 때마다 숫자가 올라감
            }
        }

        hello.setOnClickListener(click)


        // 뷰를 조작 하는 함수들
        // 1> setText  : 글씨가 바뀐다.
        // 2> setImageResource : 이미지가 바뀐다.

        //주로 사용하는 리스너들이다. 필요할 때마다 찾아보는 것이 중요하다
//        hello.setOnDragListener();
//        val editText : EditText = findViewById(R.id.editText)
//        editText.setOnDragListener();
    }
}