Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login',
    path: '/'
    layoutTemplate: 'blank_layout'

  @route 'register',
    template: 'registration'
    layoutTemplate: 'blank_layout'

  @route 'chat'

  @route 'resetPassword',
    layoutTemplate: 'blank_layout'

requireLogin = (pause) ->

  unless Meteor.user()
    if Meteor.loggingIn()
      this.render(this.loadingTemplate)
    else
      this.render('login')

    pause()

Router.onBeforeAction('loading')
Router.onBeforeAction requireLogin, { only: 'chat' }