@ListingsListItem = React.createClass
  displayName: "ListingsListItem"

  propTypes:
    listing: React.PropTypes.object.isRequired

  render: ->
    <section className="listings-list-item">
      A listing
    </section>
