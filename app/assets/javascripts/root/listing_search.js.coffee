$(document).ready ->
  form = $('.listings')

  processForm = (e) ->
    if e.preventDefault
      e.preventDefault()

    CR_LAT = 50.03312260000001
    CR_LNG = -125.27333540000001

    CR_ADDRESS = 'address=Campbell+River&address_type=city&city_name=Campbell+River&prov_code=BC&search_str=Campbell+River%2C+BC%2C+Canada'

    minPrice = form.find('.price-range').slider('option', 'values')[0]
    maxPrice = form.find('.price-range').slider('option', 'values')[1]

    bedrooms  = encodeURIComponent(form.find('#listings_bedrooms').val()   || '1+')
    bathrooms = encodeURIComponent(form.find('#listings_bathrooms').val()  || '1+')

    url = "http://www.royallepage.ca/search/homes/bc/campbell-river/?min_price=#{minPrice}&max_price=#{maxPrice}&lat=#{CR_LAT}&lng=#{CR_LNG}&#{CR_ADDRESS}&beds=#{bedrooms}&baths=#{bathrooms}"

    window.open url

    # You must return false to prevent the default form behavior
    false

  form.on 'submit', processForm
