package com.example.app

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class Intent1 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_intent)

        val change_activity : Button = findViewById(R.id.change_activity)

        change_activity.setOnClickListener{
//            방법1
//            val intent = Intent(this@Intent1,Intent2::class.java)//요청을 만들기만 함
////            // Key, Value 방식 -> Key와 value를 쌍으로 만들어 저장다. -> Dictionary
//            intent.putExtra("number1", 1) //값을 넣을 때
//            intent.putExtra("number2", 2)
//            startActivity(intent) // ~~전달만 하는 애~~
//            방법2 (인텐트 결과를 보냄)
//            val intent2 = Intent(this@Intent1,Intent2::class.java)
//            // Apply
//            intent2.apply {
//                this.putExtra("number1",1)
//                this.putExtra("number2",1)
//            }//intent1이 intent2에게 보낸 것!!
//            startActivityForResult(intent2,200) // ~~전달+결과도 받아보려면~~
//        // intent요청이 여러명일 수 있어서 200이라는 것 / 나중에 결과를 받을 때 결과가 맞는지 구분하기 위해서
            //암시적 인텐트
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse("http://m.naver.com"))//이 부분 보여주기
            startActivity(intent)
        }
    }
    //인텐트 결과를 받음
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if(requestCode == 200){
            Log.d("number",""+ requestCode)
            Log.d("number",""+ resultCode)//-1
            val result = data?.getIntExtra("result",0)
            Log.d("number","" + result)
        }
        super.onActivityResult(requestCode, resultCode, data)
    }
}