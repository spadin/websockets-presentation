# WebSockets Presentation

### 01: Title Screen

Today I am going to be presenting WebSockets and some ways you could use them. Feel free to ask questions at any point and I will do my best to answer them.

### 02: Before we begin

There are a couple of interactive slides in this presentation. If you could load this page on your phone or laptop we could get through those slides a little more smoothly.

I'll give you a minute to bring that up.

### 03: What are WebSockets?

Q: Has anybody here used WebSockets before?

WebSockets, as explained by Wikipedia, are a web technology providing full-duplex communication channels over a single TCP connection.

When we create web applications, we are typically using HTTP as the communication protocol.

Most of implemented an HTTP server.

With HTTP, the client, usually a web browser, sends a request to server, the server responds accordingly, then the connection is closed.

With WebSockets, the connection is kept open and the server is able to broadcast messages to the client without the client having to initiate a new connection.

WebSocket is the communication protocol for this behavior.

Q: What are some other communication protocols you may have worked with?

### 04: Other communication protocols

### 05: Two main components

WebSockets are meant to be implemented by web browsers and web servers. Although it can be used by any client or server application. There is an iOS library for dealing with WebSockets for example and I'm sure there's one for Android and others.

Regardless, WebSockets have two main components.

The first is the server. The server

* manages clients

The server attempts to keep all of the connections open. It connects users the appropriate channels. Some servers might keeping a global list of connected users, etc.

The server also

* emits messages to clients

Emitting messages is how the server communicates back to the client. These messages can be triggered by some other process. For an analytics app, a user visiting a page could trigger a message from the server which would cause a connected client to show a dot on a map for that person.

Which brings us to the second main component, the client.

The client can is where most of the cool stuff happens.

Clients

* Receive messages

Whenever the server emits a message, it will have a message type associated with it. It's an event. The client can decide to do something only with certain types of events.

In the previous example the client may not care if a new person has visited the website, so it could just ignore that message.

WebSocket libraries and services allow you to listen only to the types of events you're interested in. And your event handler gets called whenever that message type is triggered.

A client also

* Contains logic for dealing with messages

Once the client receives a message, it should have some logv for handling that information. It could be updating a counter, redrawing a  graph, etc.

### 06: What can I do with WebSockets?

You're probably wondering by now what kinds of cool things you can do with WebSockets.

### 07: Real-time Collaboration

**Add image of Google Docs and Firepad**

* Writing
* Drawing
* Coding

There are several collaborative services online. You may have noticed in Google Docs that multiple people can collaborate on a document at the same time and you can see the multiple cursors on the screen. 

Or you may have seen their drawing app where several people can use the page as a whiteboard.

Another interesting use case is remote pairing. You may have done session sharing with TMUX before and this is pretty much the same. The big difference is the user doesn't need to know TMUX. They can just visit a website a get going.

### 08: Instant Feedback
