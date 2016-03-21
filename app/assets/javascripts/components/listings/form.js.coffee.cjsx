@ListingsForm = React.createClass
  displayName: "ListingsForm"

  propTypes:
    query:      React.PropTypes.string
    bedrooms:   React.PropTypes.number
    bathrooms:  React.PropTypes.number
    priceMin:   React.PropTypes.number
    priceMax:   React.PropTypes.number

  render: ->
    <section className="react-listings-form">
      <form>
        <div className="input">
          <select>
            <option value="bedrooms">Bedrooms</option>
            <option value="1">1+</option>
            <option value="2">2+</option>
            <option value="3">3+</option>
            <option value="4">4+</option>
            <option value="5">5+</option>
          </select>
        </div>

        <div className="input">
          <select>
            <option value="bathrooms">Bathrooms</option>
            <option value="1">1+</option>
            <option value="2">2+</option>
            <option value="3">3+</option>
            <option value="4">4+</option>
            <option value="5">5+</option>
          </select>
        </div>

        <div className="input">
          <div className="price-range-container">
            <div className="price-range"></div>
            <div className="price-range-label"></div>
          </div>
        </div>

        <div className="center">
          <button className="blue">
            Search
          </button>
        </div>
      </form>
    </section>
