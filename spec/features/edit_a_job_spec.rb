require 'rails_helper'

feature "Edit promotion" do
  scenario 'sucessfully' do
    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')
    user = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id)
    job = Job.create(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company_id: company_id)

    # COLOCAR A LOGICA DO LOGIN DO COLABORADOR
    visit root_path
    login_as user
    click_on "Ver Vagas de Emprego"
    click_on job.name
    click_on "Editar"

    fill_in 'Nome', with: 'Vaga Ruby on Rails 2021'
    click_on 'Salvar'

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content('Vaga Ruby on Rails 2021')
  end
end