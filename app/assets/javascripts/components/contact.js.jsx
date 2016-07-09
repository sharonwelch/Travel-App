var Contact = React.createClass({
  propTypes: {
    contactName: React.PropTypes.string,
    contactEmail: React.PropTypes.string,
    csrf: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Name: {this.props.contactName}</div>
        <div>Email: {this.props.contactEmail}</div>
      </div>
    );
  }
});
