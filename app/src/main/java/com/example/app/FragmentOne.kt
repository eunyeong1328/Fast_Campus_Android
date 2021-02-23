package com.example.app

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.fragment.app.Fragment

class FragmentOne:Fragment() {

    interface OnDataPassLinster{ //리스너
        fun onDataPass(data : String?)
    }
    //lateinit 초기화
    lateinit var dataPassLinster: OnDataPassLinster //변수

    override fun onAttach(context: Context) {
        Log.d("life_cycle","F onAttach")
        super.onAttach(context)
        dataPassLinster = context as OnDataPassLinster //형변환
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d("life_cycle"," F nCreateView")
//-             1번 XML에 ViewComponent로 추가한다
        // 프라그먼트가 인터페이스를 처음으로 그릴 때 호출된다.
        // inflater -> 뷰를 그려주는 역할
        // container -> 부모뷰 / 프라그먼트를 어디다 넣을지
        //~뷰를 그릴 때 어떤 레이아웃을 쓸 것인지...
        //       검정색바탕,  root는 내가 붙을 뿌리를 의미함
        return inflater.inflate(R.layout.fragment_one,container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        Log.d("life_cycle","F onViewCreated")
        super.onViewCreated(view, savedInstanceState)

        val pass : Button = findViewById(R.id.button)
        //Activity의 Oncreate에서 했던 작업을 여기에서 한다.
        pass.setOnClickListener{//리스너로 데이터를 넣어주는 애
            dataPassLinster.onDataPass("Good bye")
        }

    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        Log.d("life_cycle","F onActivityCreated")
        val data = arguments?.getString("hello")
        Log.d("data", data!!)
        super.onActivityCreated(savedInstanceState)
    }

    override fun onStart() {
        Log.d("life_cycle","F onStart")
        super.onStart()
    }

    override fun onPause() {
        Log.d("life_cycle","F onPause")
        super.onPause()
    }

    override fun onStop() {
        Log.d("life_cycle","F nStop")
        super.onStop()
    }

    override fun onDestroyView() {
        Log.d("life_cycle","F onDestroyView")
        super.onDestroyView()
    }

    override fun onDetach() {
        Log.d("life_cycle","F onDetach")
        super.onDetach()
    }
}