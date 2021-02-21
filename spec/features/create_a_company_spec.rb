require 'rails_helper'

feature 'Admin creates a company' do
  scenario 'successfully' do
    # user = User.create!(email: 'matheus@code4u.com', password: '123456')

    # COLOCAR A LOGICA DO LOGIN DO COLABORADOR

    fill_in 'Nome', with: 'Code4U'
    fill_in 'Endereço', with: 'Rua A 123'
    fill_in 'CNPJ', with: '92107397000133'
    fill_in 'Site', with: 'code4u.com'
    fill_in 'Ano de Fundação', with: '2020'
    attach_file 'Logo', Rails.root.join('spec', 'support', 'logo.png')
    click_on 'Enviar'

    expect(current_path).to eq company_path(Company.last)
    expect(page).to have_content('Code4U')
    expect(page).to have_content('Rua A 123')
    expect(page).to have_content('92107397000133')
    expect(page).to have_content('2020')
    expect(page).to have_css('img[src*="logo.png"]')
  end
end