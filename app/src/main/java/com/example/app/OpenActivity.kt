package com.example.app

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity

class OpenActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_open)

        val open : Button = findViewById(R.id.open)
        val address_edit_text : EditText = findViewById(R.id.address_edit_text)
        open.setOnClickListener{
            val address = address_edit_text.text.toString()

            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(address))
            startActivity(intent)
        }
                //이건 그냥 자체로 중요하기 때문에 나중에 차근차근 이해할 것!!
        address_edit_text.addTextChangedListener(object : TextWatcher{ //object는 익명함수
            override fun afterTextChanged(s: Editable?) { //텍스트가 변하된 후에
                if (s.toString() == "abc") {
                    Log.d("edit", "text is abc")
                }
                Log.d("edit", "afterTextChanged : " + s)
            }
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) { //텍스트가 변하기 전에
                Log.d("edit","beforeTextChage : "+s)
            }

            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) { //텍스트가 변하고 있을 때
                Log.d("edit","onTextChage : "+s)
            }

        })


    }
}