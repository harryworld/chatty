trimInput = (val) ->
  val.replace(/^\s*|\s*$/g, "")

Template.login.events
  'submit #login-form': (e, t) ->
    e.preventDefault()

    email = trimInput(t.find('#account-email').value)
    password = t.find('#account-password').value

    Meteor.loginWithPassword email, password, (error) ->
      if error
        console.log "User not found or password incorrect"
      else
        console.log "Logged in as:"
        console.log Meteor.user()
        Router.go('chat')

    false