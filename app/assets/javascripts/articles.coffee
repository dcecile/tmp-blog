getInputFileName = ($input) ->
  input = $input[0]
  if input.files.length
    input.files[0].name
  else
    null

syncInputFileName = ($input, $control) ->
  # Inspired by https://github.com/twbs/bootstrap/issues/20813
  $input.on 'change', ->
    newName = getInputFileName($input)
    console.log "File changed to '#{newName}'"
    $control.text(newName)

$(document).ready ->
  syncInputFileName(
    $('.tb-file__input'),
    $('.tb-file__control'))
