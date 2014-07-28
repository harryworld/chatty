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

  @route 'resetPassword'

requireLogin = (pause) ->

  unless Meteor.user()
    if Meteor.loggingIn()
      this.render(this.loadingTemplate)
    else
      this.render('accessDenied')

    pause()

Router.onBeforeAction('loading')
Router.onBeforeAction requireLogin, { only: 'chat' }