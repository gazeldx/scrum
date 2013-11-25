time = 3
@closeWindow = ->
  if time > 0
    $(".download_link").html("<font color=red>"+time+"</font>秒后开始下载")
    time--
    window.setTimeout('closeWindow()',1000)
  else
    $(".download_link").html("<font color=red>"+time+"</font>秒后开始下载")
    $('#download_link')[0].click()

$(document).ready ->
  closeWindow()