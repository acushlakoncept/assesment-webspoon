require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "MyString",
      email: "MyString",
      title: "MyString",
      phone: 1,
      status: "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[title]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[status]"
    end
  end
end
