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

These are some other communication protocols you may have seen and worked with.

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

* Writing
* Drawing
* Coding

There are several collaboration services online. You may have noticed in Google Docs that multiple people can collaborate on a document at the same time and you can see the multiple cursors on the screen. 

Or you may have seen their drawing app where several people can use the page as a whiteboard.

Another interesting use case is collaborative coding, similar to remote pairing. You may have done session sharing with TMUX before and this is pretty much the same. One big difference is the user doesn't need to know TMUX. They can just visit a website a get going. This is in it's early stages and there aren't really any online editors that I think are ready for prime time just yet.

### 08: Real-time Collaboration

** Image slide **

### 09: Instant Feedback

An advantage to using WebSockets is that you get instant feedback from the client. This means you can do interesting things like integrate a website with live TV, so user can react to what is going on. Maybe they can fire the next person on the Apprentice.

You could also connect people at live events. Everyone could vote on the next song the band should play.

There's also live polling. I could ask you guys what your favorite color is and then get a feel for it based on a show of hands, or we could do a small app that tallies your votes and shows a real-time chart.

### 10: What's your favorite color?

** demonstration **

### 11: What can't I do with WebSockets?

There is not built-in notion of state in WebSockets. The big point of WebSockets is for the server to send messages to connected clients. 

In a chat application, you might keep a log of the conversations so when a new user enters the chat room, they see some history.

In my previous example with the colors, if I refresh the presentation, all of your votes get discarded. 

Just something to consider and work through. It's not a deal breaker when deciding wether or not to use WebSockets.

### 12: Can I use WebSockets?

WebSockets are a relatively new technology. The RFC was submitted in 2011. So the spec is around 2 years old.

### 13: Browser support

Browser makers have really gotten behind WebSockets. And the result is that at the moment, every current version of all major browsers support WebSockets.

### 14: What was previously used?

Pushing data to clients and keeping the information on a page current are not new ideas. There have been server ways to do this in the past.

Ajax polling is when you execute an ajax call at some set interval. The interval depends on the application, but the idea is to make the user have the sense that they are looking at current information.

Another interesting solution are long-lived connections. Sometimes referred to as HTTP streaming. Long-lived connections are normal HTTP connections that never close, the server would write data to the output stream and leave it open, once the server has something new to say, it just writes more to that output stream. Some browsers were able to detect that new data was written to the stream and trigger an event. Others (IE), where not so cooperative, but there were some workarounds.

And there were also Flash sockets. There are sockets similar to the ones we used to create out Java web servers. There were not ideal either, there were some security restrictions which made them complicated to use.

### 15: How do I use WebSockets?

There are several ways for you to start playing around quickly with WebSockets.

### 16: In the browser

The WebSocket API is pretty simple to use. You connect to a WebSocket endpoint and attach event handlers for when the opens, closes and receives a message.

You could also send a message over the socket or just close the socket, but I didn't add those on here.

### 17: Service providers

The realm I've mainly stayed in when dealing with WebSockets is using service providers. I've used Pusher and PubNub and both have their own merits. Firebase is a newish entry into the space.

All three have APIs and integrate with several different languages.

My earlier example uses Pusher to sending and receiving real-time messages.

One big advantage to using the service providers is they have fallbacks for browsers without WebSocket support. Which means you can deliver your app to a larger and less tech savvy audience.

### 18: Server implementations

WebSocket support can be built into just about every language. Socket.io is the first implementation that I heard about a couple of years ago and it is what got me interested on the subject.

There is a Ruby version done using EventMachine. 

** EventMachine is a Ruby library which provides event-driven I/O for using the Reactor pattern. **

** Reactor pattern is a design pattern for handling concurrent events. It can receive incoming messages from multiple concurrent clients and process them sequentially using event handlers. **

These are some other implementations.

### 19: Framework/Platform

Meteor is a platform for building web apps written in JavaScript. Meteor can be a topic all on its own. Some of the interesting features include, hot code pushes, which let you update the app while users are viewing it, and live page updates, which keep the data that everyone is viewing on separate browsers in sync.

Meteor is worth taking an afternoon to look though. If anything it may pique your interest in reactive programming.

** Reactive programming is a programming paradigm oriented around data flows and the propagation of change **

### 20: How do I test WebSockets?

I couldn't find much information about testing WebSockets during my research. This technology is rather young and there are probably not many conventions in place for testing yet. But I do have some general tips that might help make testing WebSockets less painful.

* Avoid mixing application logic with commutation login

WebSockets are the way you send message back and forth from the server to the client. Avoid mixing business login into the parts of your code that deal with transporting messages. This way you should be able to unit test your business logic like normal and have the WebSockets be something that can be tested in your integration tests.

* Integration tests

You can test WebSockets from the client-side using a headless browser like phantoms which supports WebSockets. So using a JS test framework like Jasmine or Mocha, you should be able to run just about any test you can think of.

* Mock third-party services

As a last resort you might be able to mock third-party services. There are some resources available that mock the Pusher API but mocking a third-party services is a big undertaking and risky since those APIs can change at any point without notice.

* Good luck

Yea.






