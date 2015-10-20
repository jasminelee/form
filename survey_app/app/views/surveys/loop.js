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

j = {[
  {
    "question": "What is your favorite food?"
  }, 
  {
    "question": "What is your favorite color?", 
    "choices": [
      {
        "choice": "Red"
      }, 
      {
        "choice": "Orange"
      }, 
      {
        "choice": "Yellow"
      }, 
      {
        "choice": "Green"
      }, 
      {
        "choice": "Blue"
      }, 
      {
        "choice": "Purple"
      }
    ]
  }, 
  {
    "question": "What kind of computer do you use?", 
    "choices": [
      {
        "choice": "Mac", 
        "follow-ups": [
          {
            "question": "What type of Mac do you own?", 
            "choices": [
              {
                "choice": "Notebook", 
                "follow-ups": [
                  {
                    "question": "What model?"
                  }, 
                  {
                    "question": "How many years have you owned it?"
                  }
                ]
              }, 
              {
                "choice": "Desktop"
              }
            ]
          }
        ]
      }, 
      {
        "choice": "Windows"
      }, 
      {
        "choice": "Other", 
        "follow-ups": [
          {
            "question": "Other -- please describe."
          }
        ]
      }
    ]
  }
]};