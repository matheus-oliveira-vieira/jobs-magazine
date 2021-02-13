require 'rails_helper'

feature 'Visitor visit home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs Magazine')
    expect(page).to have_content('Bem vindo ao Jobs Magazine')
  end
end