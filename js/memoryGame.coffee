
timeStart ->
  count = 0
  gameTimer = setInterval(->
    count += 1
    timerDiv = $('#timer')[0]
    timerDiv.innerHTML = "Timer: " + count.toString() + " secs"
  , 1000)

checkForWin ->
  clearInterval gameTimer if $('.hidden').length is 0