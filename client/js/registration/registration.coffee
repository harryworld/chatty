MinimumPasswordLength = 4

passwordConfirmed = (password, confirmation) ->
  password == confirmation

passwordIsValid = (password) ->
  password.length >= MinimumPasswordLength

createUserAndLogin = (email, password) ->
  Accounts.createUser { email: email, password: password }, (error) ->
    if error
      console.log "Accounts creation failed:"
      console.log error
    else
      console.log "Success. Logged in as:"
      console.log Meteor.user()
      Router.go('chat')

Template.registration.events

  'submit #registration-form': (e, t) ->
    e.preventDefault()

    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    confirm = t.find('#accounts-confirm').value

    console.log "Signing up..."

    if passwordIsValid(password)
      console.log "Password is valid"
      if passwordConfirmed(password, confirm)
        createUserAndLogin(email, password)
      else
        console.log "Password and confirmation does not match."
    else
      console.log "Password is invalid"

    false