# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Copier
  BUTTON_SELECTOR = '#copy_to_clipboard'
  INPUT_SELECTOR = '#short_url'
  MESSAGE_SELECTOR = '#message'

  constructor: ->
    @bindClick()

  bindClick: ->
    $(BUTTON_SELECTOR).click =>
      $(INPUT_SELECTOR).select()
      try
        document.execCommand('copy')
        @displayMessage("Copied to clipboard!")
      catch error
        @displayMessage("Oops, unable to copy.")

  displayMessage: (message) ->
    $messageContainer = $(MESSAGE_SELECTOR)
    $messageContainer.text(message)
    $messageContainer.fadeIn().delay(750).fadeOut()


$(document).ready ->
  new Copier()
