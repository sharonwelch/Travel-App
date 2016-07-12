var Contact = React.createClass({
  propTypes: {
    contactName: React.PropTypes.string,
    contactEmail: React.PropTypes.string,
    csrf: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>{this.props.contactName}</div>
        <div>Email: {this.props.contactEmail}</div>
        <br></br>
      </div>
    );
  }
});
