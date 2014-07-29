createMessage = (user, content) ->
  { user: user, content: content }

getUserName = (user) ->
  user.name || user.emails[0].address

Template.chat.events
  'submit #message_form': (e, t) ->

    messageInput = t.find('#message')

    content = messageInput.value
    user = getUserName Meteor.user()

    message = createMessage(user, content)
    Messages.insert message

    e.target.reset()
    e.preventDefault()
    false

Template.chat.helpers
  chatMessages: ->
    Messages.find({})
