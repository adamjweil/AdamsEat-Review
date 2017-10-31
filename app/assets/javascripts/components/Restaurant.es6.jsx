class Restaurant extends React.Component {
  render() {
    return(
      <div>
      {this.props.restaurants.map((restaurant, i) =>
        <div id="squares">
              <center><a>{restaurant.name}</a></center>
              <center><h5>{restaurant.city}, {restaurant.state}</h5></center>
        </div>
      )};
      </div>
    )
  }
}
