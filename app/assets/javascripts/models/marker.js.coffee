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
    @

  setMap: (map) ->
    @gmarker.setMap(map)
    @
  