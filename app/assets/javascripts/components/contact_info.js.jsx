var ContactInfo = React.createClass({
  propTypes: {
    contacts: React.PropTypes.array,
    csrf: React.PropTypes.string
  },

  render: function() {
    var arrayOfContacts = [];
    var contact;
    var contact_name;
    var contact_email;

    for (var i = 0; i < this.props.contacts.length; i ++) {
      contact = this.props.contacts[i];
      contact_name = contact.contact_name;
      contact_email = contact.contact_email;

      arrayOfContacts.push(<Contact contactName = {contact_name} contactEmail = {contact_email}/>);
    }
    return (
      <div>
        <div>Our Team {arrayOfContacts}</div>
      </div>
    );
  }
});
