class RestaurantList extends React.Component {
  render() {
    return(
      <div id="restaurant-list">
        <Restaurant
          restaurants={this.props.restaurants} />
      </div>
    )
  }
}
