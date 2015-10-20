function recursiveDecode(obj){

  $.each(obj, function(n, v) {

    if(typeof v === 'object'){
      recursiveDecode(v);
    }  
    else{
      console.log(n +'='+v);
    }

  });

};

recursiveDecode(j); 

var j = $.getJSON("follow_ups.json");