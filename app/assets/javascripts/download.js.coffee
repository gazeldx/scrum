time = 3
@closeWindow = ->
  if time > 0
    $(".download_link span.time").html(time)
    time--
    setTimeout("closeWindow()", 1000)
  else
    $(".download_link span.time").html(time)
    $('#download_link')[0].click()

$(document).ready ->
  closeWindow()