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
    @makeIconsDraggable()

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

  makeIconsDraggable: ->
    @markerIcons.draggable({
      helper: 'clone'
      containment: 'parent'
      stop: (event, ui) => @placeMarker(event, ui)
    })

  placeMarker: (event, ui) ->
    offset = @mapEl.position()
    x = event.pageX - offset.left
    y = event.pageY - offset.top
    point = new google.maps.Point(x,y)
    latlng = @overlay.getProjection().fromContainerPixelToLatLng(point)
    icon = ui.helper[0].src
    marker = Marker.create({
      latitude: latlng.lat()
      longitude: latlng.lng()
      icon: icon
    })
    marker.setMap(@map)