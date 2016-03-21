@ListingsList = React.createClass
  displayName: "ListingsList"

  propTypes:
    query:      React.PropTypes.string
    bedrooms:   React.PropTypes.number
    bathrooms:  React.PropTypes.number
    priceMin:   React.PropTypes.number
    priceMax:   React.PropTypes.number

  getInitialState: ->
    loading:  true
    listings: null

  renderListing: (listing) ->
    return unless listing

    <ListingListItem listing={ listing } />

  renderListings: ->
    if @state.loading
      <div className="loading center">
        <span className="loader loader-quart"></span>
        Loading...
      </div>
    else
      for listing in @state.listings
        @renderListing(listing)

  render: ->
    <section className="react-listings-list">
      { @renderListings() }
    </section>
