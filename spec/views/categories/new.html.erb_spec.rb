require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  describe 'Rendering the New Category Form' do
    it 'displays the "New Category" title' do
      render
      expect(rendered).to have_content('New Category')
    end

    it 'renders the category form fields' do
      render
      expect(rendered).to have_field('Enter New Category')
      expect(rendered).to have_field('Enter Image URL for the icon')
      expect(rendered).to have_button('CREATE CATEGORY')
    end

    it 'renders the "Back to Categories" link' do
      render
      expect(rendered).to have_link('Back to Categories', href: categories_home_path)
    end
  end
end
