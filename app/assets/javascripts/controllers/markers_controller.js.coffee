$ = jQuery.sub()
Marker = App.Marker

class App.MarkersController extends Spine.Controller
  elements:
    "#map" : "mapEl"
    ".marker" : "markerIcons"

  constructor: ->
    super
    @html JST["views/markers/index"]
    @createMap()
    @createMapOverlay()

  createMap: ->
    options = {
      zoom: 6
      center: new google.maps.LatLng(39.828175, -98.5795)
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @map = new google.maps.Map(@mapEl[0], options)

  createMapOverlay: ->
    @overlay = new google.maps.OverlayView()
    @overlay.draw = ->
    @overlay.setMap(@map)