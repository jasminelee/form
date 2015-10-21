//  
// problem: javascript file is included and downloaded separately from the rest of the application's assets. 
// This causes the browser to make another request to the server, thus increasing the page load time and in turn, which isn't ideal
// 

console.log("New.js -- trying stuff out")

questions = JSON.parse('<%= @data %>');

for (each in questions){
	console.log(question);
}

 // $('<label/>').attr(for: question.identifier).text(question.text).appendTo(some form)
 //    $('<input/>').attr(type: 'text', name: question.identifier).appendTo(some form)


class QuestionHandler {

	recursively parse through json object 
	use jQuery to access id/class labels and render questions (using jQuery)


	save users answers to hidden fields using jQuery
	hidden fields must be :answers, :kind_id, :questions bc Create action is expecting it 

	$().submit()