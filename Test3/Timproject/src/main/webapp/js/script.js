window.onload=function(){
    var i = document.getElementsByTagName("img")[0];
    console.log(i);
    var m = document.getElementsByTagName("ul")[1];
    var m2 = document.getElementsByTagName("ul")[2];
    console.log(m);
    i.addEventListener("click", function(){ 
        m.setAttribute("style", "display:block;");
        m2.setAttribute("style", "display:block;");
    });
}