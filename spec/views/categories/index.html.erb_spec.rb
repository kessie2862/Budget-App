require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  it "displays the 'Budget App' title" do
    render
    expect(rendered).to have_content('Budget App')
  end

  it "displays 'New? Register Here.' link" do
    render
    expect(rendered).to have_link('New? Register Here.', href: new_user_registration_path)
  end

  it "displays 'Registered? Sign In Now.' link" do
    render
    expect(rendered).to have_link('Registered? Sign In Now.', href: new_user_session_path)
  end
end
