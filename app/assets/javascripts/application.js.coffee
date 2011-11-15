#= require jquery_ujs
#= require spine/spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree .

class App extends Spine.Controller
  constructor: ->
    super
    @append(new App.MarkersController)


window.App = App