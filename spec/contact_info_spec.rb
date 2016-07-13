require 'contact_info'
require 'rails_helper'

RSpec.describe "contact info spec" do
  it "correctly provides full names for admins" do
    actual = contact.first
    expected = ["Sharon Welch", "Ellis Burgoon Miskell", "Zoe Henry"]
    expect(actual).to eq(expected)
  end
  it "correctly provides emails for admins" do
    actual = contact.last
    expected = ["sharon.welch@yale.edu", "ellis.burgoonmiskell@yale.edu", "zoe.henry@yale.edu"]
    expect(actual).to eq(expected)
  end
end
