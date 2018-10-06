require 'rails_helper'

RSpec.describe 'top page', type: :feature do
  it 'show hello world' do
    visit ''
    sleep(2)

    expect(page).to have_content 'user ids: []'
  end
end
