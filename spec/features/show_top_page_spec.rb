require 'rails_helper'

RSpec.describe 'top page', type: :feature do
  before do
    create(:user, id: 1)
    create(:user, id: 2)
  end

  it 'show user ids' do
    visit ''
    sleep(2)

    expect(page).to have_content 'user ids: [ 1, 2 ]'
  end
end
