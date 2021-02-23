package com.example.app

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class Calculator : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_calculator)

        //new -> old(new + old)
        var new = "0"
        var old = "0"

        val result : TextView = findViewById(R.id.result)
        val one : TextView = findViewById(R.id.one)
        one.setOnClickListener{
            new = new + "1"
            result.setText(new)
        }
        val two : TextView = findViewById(R.id.two)
        two.setOnClickListener{ }
        new = new + "2"
        result.setText(new)
        val three : TextView = findViewById(R.id.three)
        three.setOnClickListener{
            new = new + "3"
            result.setText(new)
        }
        val four : TextView = findViewById(R.id.four)
        four.setOnClickListener{
            new = new + "4"
            result.setText(new)
        }
        val five : TextView = findViewById(R.id.five)
        five.setOnClickListener{
            new = new + "5"
            result.setText(new)
        }
        val six : TextView = findViewById(R.id.six)
        six.setOnClickListener{
            new = new + "6"
            result.setText(new)
        }
        val seven : TextView = findViewById(R.id.seven)
        two.setOnClickListener{
            new = new + "7"
            result.setText(new)
        }
        val eight : TextView = findViewById(R.id.eight)
        eight.setOnClickListener{
            new = new + "8"
            result.setText(new)
        }
        val nine : TextView = findViewById(R.id.nine)
        nine.setOnClickListener{
            new = new + "9"
            result.setText(new)
        }
        val zero : TextView = findViewById(R.id.zero)
        zero.setOnClickListener{
            new = new + "0"
            result.setText(new)
        }


        val plus : TextView = findViewById(R.id.plus)
        plus.setOnClickListener{
            old = (old.toInt() + new.toInt()).toString()
            new = "0"
            result.setText(old)
        }
        val clear : TextView = findViewById(R.id.clear) //초기화
        clear.setOnClickListener{
            var new = "0"
            var old = "0"
            result.setText("0")
        }


    }
}