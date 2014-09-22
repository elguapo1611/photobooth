class @Photobooth
  constructor: () ->
    @count = 3
    @countdownRunning = false
    # @setTextPosition()
    @setup()

  setTextPosition: =>
    position = ($(window).height() / 2 - $("#coundown").height() / 2) + "px"
    console.log(position)
    $("#countdown").css("top", position)

  takePhoto: =>
    $.post $("#countdown").attr("data-url"), (data) ->
      $("#countdown-bg").hide()
      $("#countdown").hide()
      $("#countdown h1").html("")
      $("#photostream").prepend "<li>" + $("#current_photo").html() + "</li>"
      $("#current_photo").html "<a class=\"thumbnail\"><img width=\"780px\" src=\"" + data.image_url + "\"/></a>"
      return

  startCountDown: =>
    setTimeout (=>
      @count = @count - 1
      if @count >= 0
        $("#countdown h1").html(@count + 1)
        @startCountDown()
      else
        @countdownRunning = false
        $("#countdown h1").html("cheese!!!")
        @takePhoto()
        @count = 3
      return
    ), 1000

  setup: =>
    $(document).bind "keypress", (e) =>
      console.log(e.keyCode)
      if e.keyCode is 13
        @setTextPosition();
        # @countdownRunning = true
        # alert("yo")
        $("#countdown-bg").show()
        $("#countdown").show()
        @startCountDown()
      return
