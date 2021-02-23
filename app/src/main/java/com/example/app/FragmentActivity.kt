package com.example.app

import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class FragmentActivity : AppCompatActivity(), FragmentOne.OnDataPassLinster{
    override fun onDataPass(data: String?) {
        Log.d("pass", "" + data)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_fragment)
        Log.d("life_cycle","onCreate")

        val fragmentOne : FragmentOne = FragmentOne() //★☆★☆전역변수로 올리는게 중요
        // 프라그먼트에 data를 넣어주는 방법
        val bundle: Bundle = Bundle()
        bundle.putString("hello", "hello")
        fragmentOne.arguments = bundle

        //프라그먼트 추가
        val button : Button = findViewById(R.id.button)
        button.setOnClickListener{
            //프라그먼트를 동적으로 작동하는 방법
            //프라그먼트 붙이는 방법 replace/add
            val fragmentManager = supportFragmentManager //위에 AppCompatActivity상속

            //- 코드로(동적)으로 추가한다 / 동적(추가하고 싶을 때 추가하고 없애고 싶을 때 없앨 수 있다)
            //Transaction
            //작업의 단위 -> 시작과 끝이 있다.
            val fragmentTransaction = fragmentManager.beginTransaction()  //이 코드가 실행되는 순간 트랜잭션 실행
            fragmentTransaction.replace(R.id.container, fragmentOne)
            //앞에거랑 뒤에거를 바꿔주는 것이다. / 뷰id 자리에 fragment가 오는 것이다.
            fragmentTransaction.commitAllowingStateLoss()
            //끝을 내는 방법
            //commit       -> 시간 될 때 해(좀더 안정적)
            //commitnow     -> 지금 당장해
        }
        //프라그먼트 떼어내기
        //프라그먼트 remove(붙였다 떼다 가능)/detach(떼어내기만 가능) 하는 방법
        val button2 : Button = findViewById(R.id.button2)
        button2.setOnClickListener{
            val fragmentManager = supportFragmentManager
            val fragmentTransaction = fragmentManager.beginTransaction()
            fragmentTransaction.remove(fragmentOne)
            fragmentTransaction.commit()
        }
    }

    //오버라이드
    override fun onStart() {
        super.onStart()
        Log.d("life_cycle","onStart")
    }

    override fun onResume() {
        super.onResume()
        Log.d("life_cycle","onResume")
    }

    override fun onPause() {
        super.onPause()
        Log.d("life_cycle","onPause")
    }

    override fun onStop() {
        super.onStop()
        Log.d("life_cycle","onStop")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("life_cycle","onDestroy")
    }

}