let username = "Utilisateur 1";

const socket = new SockJS('/chat-websocket');
//Server
const stompClient = Stomp.over(socket);


const messagesDiv = document.getElementById('messages');
const form = document.getElementById('chatForm');
const input = document.getElementById('messageInput');


//Server connexion
stompClient.connect({}, () => {
    stompClient.subscribe('/topic/messages', (messageOutput) => {
        // convert message to JS object
        const message = JSON.parse(messageOutput.body);
        showMessage(message);
    });
});

//Sending a message
form.addEventListener('submit', function (e) {
    //Prevents the default behavior of the form to reload the page
    e.preventDefault();
    //We take the text typed by the user
    const content = input.value.trim();
    if (content === "") return;

    const message = {
        from: username,
        content: content
    };
    //Sends message to server at /app/chat via STOMP (WebSocket protocol)
    stompClient.send("/app/chat", {}, JSON.stringify(message));
    //empties the input field so that the user can write a new message
    input.value = '';
});

//Display message
//This function is executed each time a message is received (via WebSocket) to display it on the screen
function showMessage(message) {
    //create a new HTML <div> element to contain the message
    const messageElem = document.createElement('div');
    //add the CSS class “message” to this div to style it
    messageElem.classList.add('message');
    
    const isUser = message.from === username;
    //style the message according to the type of user agent or user
    messageElem.classList.add(isUser ? 'user' : 'agent');
    
    //creates a new HTML <img> element in the page
    const icon = document.createElement('img');
    //particular style to the image
    icon.classList.add('icon');

    if (isUser) {
        icon.src = 'https://img.icons8.com/color/48/000000/user.png'; 
        icon.alt = 'User icon';
    } else {
        icon.src = 'https://img.icons8.com/color/48/000000/administrator-male.png'; 
        icon.alt = 'Agent icon';
    }

    //creates a text to be displayed
    const text = document.createElement('span');
    text.innerText = `${message.from}: ${message.content}`;
    
   
    messageElem.appendChild(icon);
    messageElem.appendChild(text);

    messagesDiv.appendChild(messageElem);
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

function changeUser(newUser) {
    username = newUser;
    document.querySelectorAll('.user').forEach(user => user.classList.remove('active'));
    const userElem = Array.from(document.querySelectorAll('.user')).find(user => user.textContent === newUser);
    if (userElem) {
        userElem.classList.add('active');
    }
}