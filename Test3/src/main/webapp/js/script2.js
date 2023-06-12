window.onload=function(){
	console.log("야 되나");
    
    
    //var a = Date.now();//초
    //var a= console.time();//시간 재기
    
    //var i = document.getElementsByTagName("img")[0];
    //console.log(i);
    //var m = document.getElementsByTagName("ul")[1];
    //var m2 = document.getElementsByTagName("ul")[2];
    //console.log(m);
        var ti = document.getElementsByClassName("time")[0];
    console.log(ti);
        //div 'time'
    /*i.addEventListener("click", function(){ 
        m.setAttribute("style", "display:block;");
        m2.setAttribute("style", "display:block;");
    });*/

 
	

    //var a = new Date();

    
    //var e = console.timeEnd()*60;
    //console.log(e);


    //console.log(ti);
    //div ti 보기

 	  var fourty = 39;
   	  //fourty 에 40넣기
	var f = document.createElement("div");
	//f div 생성
	console.log("머냥"+typeof(fourty));
	f.setAttribute("style", "width: 50px; position: relative; left: 700px; top: -1500px; height:50px");
	//f에 40을 넣는다.
	document.body.appendChild(f);
	//time div의 자식노드로 f div를 넣는다.
	
	
	
	var doom = true;
	
	
	setInterval(one, 1000);
	function one(){
		f.innerHTML = fourty;
		
	}
	
	/*setTimeout(end, 1000);
	
	function end(){
		fourty = 39;
		
	}*/
	
	var ius = setInterval(iu, 60000);
	function iu(){
		
		fourty--;
			
		console.log(fourty);
		if(fourty==0){
			clearInterval(ius);
		}
		
	}
        
    var tim = document.createTextNode(60);
   console.log(tim);
    //60이라는 텍스트 노드를 만든다.
  	ti.appendChild(tim);
    //60을 div에 넣는다.
    tim = toString(tim);
    //object를 문자로 변환
    tim = parseInt(tim);
    //문자를 숫자로 변환
    console.log(typeof(tim));
    //60.
    
    tim = 60; 
    //ti에 60 넣기(초)
    
    //console.log(typeof(tim));
    //document.body.appendChild(tim);
   	
  
	

    var d = document.createElement("div");
   	//d에 div생성
    ti.appendChild(d);
    //time div의 자식노드로 d div 생성
    d.setAttribute("style", "width:23px; height:50px; background-color:#a09c9c; position:relative; top:-40px; left:43px;");
    //가리기 div 속성 부여
   	
   	
   setInterval(func,1000);//1초마다
   
   
    function func(){
		//tim.setAttribute("style", "display:inline-block;");
        tim--;//tim은 1씩 작아진다
        //document.write(tim);
        //console.log(tim);//60에서 1씩 빼기
        ti.innerHTML = tim;//교수님의 의견.
        //time div에 보이도록 tim 넣기
        if(tim<=0){
            tim = 60;
        }
        

        //DIV에 INNERHTML해서 숫자를 넣기.
    }   /*
        }*/
            //tim가 60이면. 안보이게 해주고 문자 0을 넣는다.

    //1초마다 실행
    
    
     
    
   /* var gee = document.createElement("div");
    document.body.appendChild(gee);
    gee.setAttribute("style", "width:500px; height:500px; background-color:red;");*/
 











    /*function(){
        var ti = new Date();
        console.log(ti);
    };*/

 
}