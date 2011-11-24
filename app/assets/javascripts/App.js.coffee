class App extends Spine.Controller
  constructor: ->
    super
    @append(new App.MarkersController)


window.App = App