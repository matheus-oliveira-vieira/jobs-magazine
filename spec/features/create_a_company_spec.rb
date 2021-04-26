require 'rails_helper'

feature 'Admin creates a company' do
  scenario 'successfully' do
    
    visit root_path
    
    click_on "Entrar"
    click_on "Sign up"
    select 'employee', from: 'Você é'
    fill_in I18n.t('email'), with: 'matheus@code4u.com'
    fill_in I18n.t('password'), with: '123456'
    #fill_in I18n.t('password_confirmation'), with: '123456'
    fill_in "Confirmar senha", with: '123456'
    click_on "Sign up"

    fill_in 'Nome', with: 'Code4U'
    fill_in 'Endereço', with: 'Rua A 123'
    fill_in 'CNPJ', with: '92107397000133'
    fill_in 'Site', with: 'code4u.com'
    fill_in 'Ano de Fundação', with: '2020'
    attach_file 'Logo', Rails.root.join('spec', 'support', 'logo.png')
    click_on 'Salvar'

    expect(current_path).to eq(company_path(Company.last))
    expect(page).to have_content('Code4U')
    expect(page).to have_content('Rua A 123')
    expect(page).to have_content('92107397000133')
    expect(page).to have_content('2020')
    expect(page).to have_css('img[src*="logo.png"]')
  end
end
