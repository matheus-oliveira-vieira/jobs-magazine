require 'rails_helper'

feature 'Admin creates a job' do
  scenario 'successfully' do
    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')
    user = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id)

    visit root_path
    login_as user
    click_on "Nova Vaga de Emprego"
    fill_in 'Nome', with: 'Vaga Ruby on Rails'
    fill_in 'Descrição', with: 'Uma Vaga Ruby on Rails com desafios muito interessantes'
    fill_in 'Salário', with: '2500'
    fill_in 'Nível', with: 'Júnior'
    fill_in 'Requisitos', with: 'Ruby on Rails, Git'
    fill_in 'Data de Término das candidaturas', with: '30/03/2021'
    fill_in 'Quantidade máxima de vagas', with: '10'
    choose :job_active_true
    click_on 'Salvar'

    expect(current_path).to eq(job_path(Job.last))
    expect(page).to have_content('Vaga Ruby on Rails')
    expect(page).to have_content('Uma Vaga Ruby on Rails com desafios muito interessantes')
    expect(page).to have_content('2500')
    expect(page).to have_content('Júnior')
    expect(page).to have_content('Ruby on Rails, Git')
    expect(page).to have_content( '30/03/2021')
    expect(page).to have_content('10')
    expect(page).to have_content('Ativa')
  end
end