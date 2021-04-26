require 'rails_helper'

feature 'Send a job proposition' do
  
  scenario "successfully" do

    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')

    user_employee = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id, role: 'employee')
    
    user_candidate = User.create!(email: 'carla@email.com', password: '123456', role: 'candidate', name: "Carla", cpf: 12312312312)
    
    job = Job.create!(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company: company)

    job_apply = JobApplication.create!(job_id: job.id, user_id: user_candidate.id, status: 'pendente de avaliação')
    
    visit root_path
    login_as user_employee
    click_on "Ver Vagas de Emprego"
    click_on (job.name).to_s
    click_on "Ver Todas as Candidaturas dessa Vaga"
    click_on user_candidate.name
    click_on "Fazer proposta de emprego"
    fill_in 'Mensagem', with: 'Gostaria de Trabalhar remotamente?'
    click_on 'Enviar'

    expect(page).to have_content('Gostaria de Trabalhar remotamente?')
  end

  scenario 'user accept proposition' do

    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')

    user_employee = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id, role: 'employee')
    
    user_candidate = User.create!(email: 'carla@email.com', password: '123456', role: 'candidate', name: "Carla", cpf: 12312312312)
    
    job = Job.create!(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company: company)

    job_apply = JobApplication.create!(job_id: job.id, user_id: user_candidate.id, status: 'pendente de avaliação')
    
    job_proposition = Proposition.create!(message: 'Aceita trabalhar remoto?', job_application_id: job_apply.id)
    
    visit root_path
    login_as user_candidate
    click_on 'Minhas Candidaturas'
    click_on (job.name).to_s
    click_on 'Ver propostas de emprego'
    click_on 'Aceitar'
    logout user_candidate
    login_as user_employee
    click_on "Ver Vagas de Emprego"
    click_on (job.name).to_s
    click_on "Ver Todas as Candidaturas dessa Vaga"

    expect(page).to have_content(user_candidate.name)
    expect(page).to have_content('aprovado')
  end
end