
timeStart ->
  count = 0
  gameTimer = setInterval(->
    count += 1
    timerDiv = $("#timer")[0]
    timerDiv.innerHTML = "Timer: " + count.toString() + " secs"
  , 1000)

checkForWin ->
  clearInterval gameTimer if $('.hidden').length is 0

smallGame ->
	timeStart()
	letterArray = ["A", "A", "B", "B", "C", "C", "D", "D", "E", "E"]
	shuffledArray = _.shuffle(letterArray)
	for square in shuffledArray
		do ->
	    $("<div/>").attr('class', 'hidden')
	    $("<div/>").attr('data-id', i)
	    $("<div/>").append(square)
	    $("#game_squares").append($("<div/>"))

$(".hidden").mouseover ->
  $(this).addClass "hover"

$(".hidden").mouseout ->
  $(this).removeClass "hover"

$(".hidden").on "click", ->
  revealedElements = $(".revealed")
  if revealedElements.length is 0
    $(this).addClass "revealed"
  else if $(".revealed").html() is $(this).html()
    $(this).addClass "matched"
    $(".revealed").addClass "matched"
    $(".revealed").unbind "click mouseover"
    $(".revealed").removeClass "hidden revealed"
    $(this).removeClass "hidden revealed"
    checkForWin()
  else
    $(this).addClass "revealed"
    setTimeout (->
      $(".revealed").removeClass "revealed"
    ), 800

$(document).ready ->
  letterArray = []
  $("#easy_btn").on "click", smallGame

