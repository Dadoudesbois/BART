function scrollLastMessageIntoView() {
  const messages = document.querySelectorAll('.message');
  const lastMessage = messages[messages.length - 1];
  lastMessage.scrollIntoView();

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}
