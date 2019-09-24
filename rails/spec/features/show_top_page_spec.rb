require 'rails_helper'

RSpec.describe 'top page', type: :feature do
  it 'works' do
    visit ''
    sleep(2)

    expect(page).to have_content 'Tasks'
    expect(page).to have_content 'no tasks'

    find('#add').click
    find('#form-title').set('My Todo Title')
    find('#submit').click

    expect(page).to have_content 'Tasks'
    expect(page).not_to have_content 'no tasks'
    expect(page).to have_content 'My Todo Title'
  end
end
