require 'rails_helper'

feature 'Admin creates a job' do
  scenario 'successfully' do
    # user = User.create!(email: 'matheus@code4u.com', password: '123456')

    # COLOCAR A LOGICA DO LOGIN DO COLABORADOR
    visit root_path
    click_on "Nova Vaga de Emprego"
    fill_in 'Nome', with: 'Vaga Ruby on Rails'
    fill_in 'Descrição', with: 'Uma Vaga Ruby on Rails com desafios muito interessantes'
    fill_in 'Salário', with: '2500'
    fill_in 'Nível', with: 'Júnior'
    fill_in 'Requisitos', with: 'Ruby on Rails, Git'
    fill_in 'Data de Término das candidaturas', with: '30/03/2021'
    fill_in 'Quantidade máxima de vagas', with: '10'
    click_on 'Salvar'

    expect(current_path).to eq(job_path(Job.last))
    expect(page).to have_content('Vaga Ruby on Rails')
    expect(page).to have_content('Uma Vaga Ruby on Rails com desafios muito interessantes')
    expect(page).to have_content('2500')
    expect(page).to have_content('Júnior')
    expect(page).to have_content('Ruby on Rails, Git')
    expect(page).to have_content( '30/03/2021')
    expect(page).to have_content('10')
  end
end