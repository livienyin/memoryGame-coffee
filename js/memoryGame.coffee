timeStart = ->
  count = 0
  gameTimer = setInterval(->
    count += 1
    timerDiv = $("#timer")[0]
    timerDiv.innerHTML = "Timer: " + count.toString() + " secs"
  , 1000)

checkForWin = ->
  clearInterval gameTimer if $('.hidden').length is 0

smallGame = ->
  timeStart()
  letterArray = ["A", "A", "B", "B", "C", "C", "D", "D", "E", "E"]
  shuffledArray = _.shuffle(letterArray)
  for square in shuffledArray
    do ->
        divElement = $("<div/>")
        divElement.attr('class', 'hidden')
        divElement.attr('data-id', square)
        divElement.append(square)
        divElement.on "click", ->
            console.log(this)
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
        $("#game_squares").append(divElement)

$(".hidden").mouseover ->
  $(this).addClass "hover"

$(".hidden").mouseout ->
  $(this).removeClass "hover"

$(document).ready ->
  letterArray = []
  $("#easy_btn").on "click", smallGame

