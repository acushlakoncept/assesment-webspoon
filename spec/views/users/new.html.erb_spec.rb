require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      name: "MyString",
      email: "MyString",
      title: "MyString",
      phone: 1,
      status: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[title]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[status]"
    end
  end
end
