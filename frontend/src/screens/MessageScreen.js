import './MessageScreen.css';
import React, { useContext, useReducer, useState, useEffect } from 'react'
import { Helmet } from 'react-helmet-async'
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'
import { Store } from '../../../../../BookSharing-master/BookSharing-master/frontend/src/Store'
import { toast } from 'react-toastify'
import { getError } from '../../../../../BookSharing-master/BookSharing-master/frontend/src/utils'
import axios from 'axios'

const MessageScreen = () => {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');
  const submitHandler = async (e) => {
    e.preventDefault()
    try {
      const { data } = await axios.put(
        '/api/users/message',
        
      )
      // dispatch({
      //   type: 'UPDATE_SUCCESS',
      // })
      // ctxDispatch({ type: 'USER_SIGNIN', payload: data })
      // localStorage.setItem('userInfo', JSON.stringify(data))
      toast.success('User updated successfully')
    } catch (err) {
      // dispatch({
      //   type: 'FETCH_FAIL',
      // })
      toast.error(getError(err))
    }
  }
  useEffect(() => {
    // Fetch messages from your API or database here
    // For now, let's use some hardcoded messages
    setMessages([
      { id: 1, sender: 'user1', content: 'Hello, I am interested in buying your book.' },
      { id: 2, sender: 'user2', content: 'Hi, sure! The book is still available.' },
    ]);
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (input.trim() === '') return;

    // Save the message to your API or database here
    const newMessage = { id: messages.length + 1, sender: 'user1', content: input };
    setMessages([...messages, newMessage]);
    setInput('');
  };

  return (
    <div className="messageScreen">
      <div className="messageScreen__header">Messages</div>
      <div className="messageScreen__messages">
        {messages.map((message) => (
          <div key={message.id} className={`messageScreen__message ${message.sender}`}>
            {message.content}
          </div>
        ))}
      </div>
      <form className="messageScreen__inputForm" onSubmit={handleSubmit}>
        <input
          type="text"
          className="messageScreen__input"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Type your message..."
        />
        <button type="submit" className="messageScreen__sendButton">
          Send
        </button>
      </form>
    </div>
  );
};

export default MessageScreen;