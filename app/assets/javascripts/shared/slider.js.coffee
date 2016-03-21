$(document).ready ->
  setSliderLabel = (min, max) ->
    minFormat = if min >= 1000000 then "0.0a" else "0a"
    maxFormat = if max >= 1000000 then "0.0a" else "0a"

    min = numeral(min).format(minFormat)
    max = numeral(max).format(maxFormat)

    $(".price-range-label").text("Price: $" + min + " - $" + max)

  $(".price-range").slider({
    range: true,
    min: 50000,
    max: 2000000,
    values: [0, 600000],
    step: 50000,
    slide: (event, ui) ->
      setSliderLabel(ui.values[0], ui.values[1])
  })

  setSliderLabel(0, 600000)
