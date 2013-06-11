require "spec_helper"

describe "User signing up" do
  let(:user) { FactoryGirl.build(:user) }
  
  it "should be able to sign up from the home page" do
    visit root_path
    click_on "Sign up"
    page.should have_content("Sign up")
    expect(current_path).to eql(new_user_registration_path)
  end

  it "should create a user if I fill in the required information" do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: user[:email]
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Sign up"

    lin = User.last
    expect(lin.email).to eql(user[:email])
  end

  it "should not create a user if a valid email is not specified" do
    prev_count = User.count
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: "lashdf"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Sign up"

    expect(User.count).to eql(prev_count)
  end

end