Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login',
    path: '/'
    layoutTemplate: 'blank_layout'