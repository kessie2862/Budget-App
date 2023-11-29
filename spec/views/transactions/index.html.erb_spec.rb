# spec/views/transactions/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'transactions/index.html.erb', type: :view do
  before do
    assign(:title, 'Transactions')
    assign(:transactions, [])
    assign(:category, double(name: 'Sample Category', icon: 'icon_url'))
    assign(:total, 0)
  end

  it 'displays the page title and a back link' do
    render
    expect(rendered).to have_content('Transactions')
    expect(rendered).to have_content('Back to Categories')
  end

  it 'displays a message when no transactions are present' do
    render
    expect(rendered).to have_selector('p.text-center', text: "Currently you don't have any transaction")
  end

  it 'displays a link to add a new transaction' do
    render
    expect(rendered).to have_content('ADD NEW TRANSACTION')
  end
end
