

function changeValEq(el){
	
  let qt =  parseFloat(document.querySelector(".qt").textContent);
  let qt1 = parseFloat(document.querySelector(".qt1").textContent);
  let price = parseFloat(document.querySelector(".price").textContent);
  let  price1= parseFloat(document.querySelector(".price1").textContent);
  let eq = Math.round(price*qt*100)/100;
  let eq1 = Math.round(price1*qt1*100)/100;	
	
  el.parent().children(".full-price1").html(eq1 + "");

    el.parent().children(".full-price").html(eq + "");

    changeTotal();
   
    //FOI USUADO O SESSION STORAGE PARA ARMAZENAR OS DADOS NA
   //SESSÃO PARA QUE SEJA POSSIVEL USAR ESSAS MESMAS VARIAVEIS EM OUTRO SCRIPT

   sessionStorage.setItem("ingMeio", eq);
   sessionStorage.setItem("ingInt", eq1);
   sessionStorage.setItem("qtdMeio", qt);
   sessionStorage.setItem("qtdInt", qt1);

}



   


function changeTotal(){
    let price = 0;
    $(".full-price").each(function(index){
       price += parseFloat($(".full-price").eq(index).html());
    });
     $(".full-price1").each(function(index){
       price += parseFloat($(".full-price1").eq(index).html());
    });

    price = Math.round(price*100)/100;
    let fullPrice = Math.round((price)*100)/100;

    if(price ==0){
        fullPrice = 0;
    }
    $(".subtotal span").html(price);
    $(".total span").html(fullPrice);


   //FOI USUADO O SESSION STORAGE PARA ARMAZENAR OS DADOS NA
   //SESSÃO PARA QUE SEJA POSSIVEL USAR ESSAS MESMAS VARIAVEIS EM OUTRO SCRIPT

    sessionStorage.setItem("totalIng", fullPrice);
   
  
}





$(document).ready(function(){
     
        $(".qt-plus").click(function(){
            $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html())+1);
            $(this).parent().children(".full-price").addClass("added");
            let el = $(this);
            window.setTimeout(function(){el.parent().children(".full-price").removeClass("added");changeValEq(el);
        },150);
     
    });
 
  
     $(".qt-plus").click(function(){
            $(this).parent().children(".qt1").html(parseInt($(this).parent().children(".qt1").html())+1);
            $(this).parent().children(".full-price1").addClass("added");
            let el = $(this);
            window.setTimeout(function(){el.parent().children(".full-price1").removeClass("added");changeValEq(el);
        },150);

    });



    $(".qt-minus").click(function(){
        child = $(this).parent().children(".qt");
        if(parseInt(child.html())>=1){
            child.html(parseInt(child.html())-1);
        }
        $(this).parent().children(".full-price").addClass("minused");
        let el =  $(this);
        window.setTimeout(function(){el.parent().children(".full-price").removeClass("minused"); changeValEq(el);},150);
   
    });


    $(".qt-minus").click(function(){
        child = $(this).parent().children(".qt1");
        if(parseInt(child.html())>=1){
            child.html(parseInt(child.html())-1);
        }
        $(this).parent().children(".full-price1").addClass("minused");
        let el =  $(this);
        window.setTimeout(function(){el.parent().children(".full-price1").removeClass("minused"); changeValEq(el);},150);
     
    });


    window.setTimeout(function(){$(".is-open").removeClass("is-open")},1200);
});




