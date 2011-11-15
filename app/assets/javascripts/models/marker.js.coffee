class App.Marker extends Spine.Model
  @configure 'Marker', 'latitude', 'longitude', 'icon'
  @extend Spine.Model.Ajax

  constructor: ({latitude: @latitude, longitude: @longitude, icon: @icon}) ->
    super
    @gmarker = new google.maps.Marker(
      position: new google.maps.LatLng(@latitude, @longitude)
      icon: @icon
      draggable: true
    )
    google.maps.event.addListener(@_marker, 'dragend', (event) => @dragEnd(event))
    google.maps.event.addListener(@_marker, 'rightclick', (event) => @rightClick(event))
    @

  dragEnd: (event) ->
    @updateAttributes({
      latitude: @gmarker.getPosition().lat()
      longitude: @gmarker.getPosition().lng()
    })

  rightClick: (event) ->
    @gmarker.setMap(null)
    @gmarker.destroy()

  setMap: (map) ->
    @gmarker.setMap(map)
    @
  