package com.example.app

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class Intent2 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_intent2)

        val result : Button = findViewById(R.id.result)
        result.setOnClickListener{
            val number1 = intent.getIntExtra("number1",0)
            val number2 : Int = intent.getIntExtra("number2",0)

            Log.d("number",""+number1)
            Log.d("number",""+number2)

            val result = number1 + number2 //결과값 구했고
            val resultIntent = Intent() //결과값은 Intent를 만들어 넣어준다!!

            resultIntent.putExtra("result",result) //결과값을 넣음
            setResult(Activity.RESULT_OK,resultIntent) //-1 잘받았고 결과값을 OK한다.
// 결과를 보내는 쪽은 첫 파라미터(resultCode)를 보내주고 두번째 파라미터(Intent에 넣어줄 데이터=결과값)
//            resultIntent를 setResult라는 함수에 할당해준다.
//            setResult(-1) 밑에 처럼 사용해도 된다. 다만, 위처럼 사용하면 보기 편함
            finish() // -> Activity 종료
        // Stack(위로 쌓는다)이라는 개념 / intent1이 올라가고 intent2가 올라가고 finish는 올라간 intent2가 없어짐
        }

    }
}