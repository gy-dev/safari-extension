// document.addEventListener("DOMContentLoaded", function(event) {
//     safari.extension.dispatchMessage("Hello World!");
// });

document.addEventListener("DOMContentLoaded", function(event) {
	// Set us up to receive messages from the app
	
	safari.self.addEventListener("message", handleMessage);

	// Send a message back to the application. Doesn't do anything
	// in this example, but this is how you do it.

	//safari.extension.dispatchMessage("Hello World!");

	window.addEventListener("message", function(event){
		if(event.data){
			safari.extension.dispatchMessage(event.data);
		}
	});
	
	return;
	var newElement = document.createElement("img");
    newElement.src = safari.extension.baseURI + "myCat.jpg";
    document.body.insertBefore(newElement, document.body.firstChild);
});

function handleMessage(event) {
	console.log(event.name);
	console.log(event.message);
//    alert(event.name);
//    alert(event.message);
	//从扩展接受到的消息转发给网页
	window.postMessage(event.message,"*");
}

