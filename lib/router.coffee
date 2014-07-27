Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login',
    path: '/'
    layoutTemplate: 'blank_layout'

  @route 'register',
    template: 'registration'
    layoutTemplate: 'blank_layout'
