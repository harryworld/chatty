@messagesRendered = 0

createMessage = (userId, username, content) ->
  { userId: userId, user: username, content: content }

getUserName = (user) ->
  user.name || user.emails[0].address

scrollTop = (element) ->
  $('html, body').animate({
    scrollTop: element.offset().top
  }, '50000', 'easeInOutCubic')

Template.chat.events
  'submit #message_form': (e, t) ->

    messageInput = t.find('#message')

    content = messageInput.value
    user = getUserName Meteor.user()
    userId = Meteor.user()._id

    message = createMessage(userId, user, content)
    Messages.insert message

    e.target.reset()
    e.preventDefault()

    false

Template.message.rendered = ->
  messagesRendered += 1
  if messagesRendered == Messages.find().count()
    scrollTop($(this.lastNode))

Template.chat.helpers
  chatMessages: -> Messages.find({})

Template.message.helpers
  me: (message) ->
    if Meteor.userId() == message.userId then "me"
