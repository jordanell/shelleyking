window.initializeSelects = () ->
  $('select').each ->
    $this = $(this)
    numberOfOptions = $(this).children('option').length
    $this.addClass 'select-hidden'
    $this.wrap '<div class="select"></div>'
    $this.after '<div class="select-styled"></div>'
    $styledSelect = $this.next('div.select-styled')
    $styledSelect.text $this.children('option').eq(0).text()
    $list = $('<ul />', 'class': 'select-options').insertAfter($styledSelect)

    i = 0
    while i < numberOfOptions
      $('<li />',
        text: $this.children('option').eq(i).text()
        rel: $this.children('option').eq(i).val()).appendTo $list
      i++

    $listItems = $list.children('li')

    $styledSelect.click (e) ->
      e.stopPropagation()
      $('div.select-styled.active').each ->
        $(this).removeClass('active').next('ul.select-options').hide()
        return
      $(this).toggleClass('active').next('ul.select-options').toggle()
      return

    $listItems.click (e) ->
      e.stopPropagation()
      $styledSelect.text($(this).text()).removeClass 'active'
      $this.val $(this).attr('rel')
      $list.hide()
      return

    $(document).click ->
      $styledSelect.removeClass 'active'
      $list.hide()
      return
    return

$(document).ready ->
  window.initializeSelects()
