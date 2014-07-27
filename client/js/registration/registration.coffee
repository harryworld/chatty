passwordConfirmed = (password, confirmation) ->
  password == confirmation

Template.registration.events

  'submit #registration-form': (e, t) ->
    e.preventDefault()

    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    confirm = t.find('#accounts-confirm').value

    console.log "Signing up..."

    if passwordConfirmed(password, confirm)
      console.log email, password, confirm
      Accounts.createUser { email: email, password: password }, (error) ->
        if error
          console.log "Accounts creation failed"
        else
          console.log "Success. Logged in as:"
          console.log Meteor.user()
          Router.go('chat')

    else
      console.log "Password and confirmation does not match."

    false