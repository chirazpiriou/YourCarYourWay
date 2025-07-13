const socket = new SockJS('/chat-websocket');
const stompClient = Stomp.over(socket);
const messagesDiv = document.getElementById('messages');
const form = document.getElementById('chatForm');
const input = document.getElementById('messageInput');
const username = "Rémi Fasol"; // à remplacer dynamiquement

stompClient.connect({}, () => {
    stompClient.subscribe('/topic/messages', (messageOutput) => {
        const message = JSON.parse(messageOutput.body);
        showMessage(message);
    });
});

form.addEventListener('submit', function (e) {
    e.preventDefault();
    const content = input.value;
    if (content.trim() === "") return;

    const message = {
        from: username,
        content: content
    };
    stompClient.send("/app/chat", {}, JSON.stringify(message));
    input.value = '';
});

function showMessage(message) {
    const messageElem = document.createElement('div');
    messageElem.classList.add('message');
    messageElem.classList.add(message.from === username ? 'user' : 'agent');
    messageElem.innerText = message.content;
    messagesDiv.appendChild(messageElem);
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
}
