require 'rails_helper'

feature 'View job applies' do
  
  scenario "successfully" do

    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')

    user_employee = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id, role: 'employee')
    
    user_candidate = User.create!(email: 'carla@email.com', password: '123456', role: 'candidate', name: "Carla", cpf: 12312312312)
    user_candidate2 = User.create!(email: 'marcos@email.com', password: '123456', role: 'candidate', name: "Marcos", cpf: 12312312312)
    
    job = Job.create!(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company: company)
    job2 = Job.create!(name: 'Vaga React', 
                      description: 'Uma Vaga React desafiadora', 
                      salary: '2000', 
                      level: 'Júnior', 
                      requirements: 'React, Git', 
                      expiration_date: '30/05/2021', 
                      qty_candidates: '4', company: company)
    
    job_apply = JobApplication.create!(job_id: job.id, user_id: user_candidate.id, status: 'pendente de avaliação')
    job_apply2 = JobApplication.create!(job_id: job2.id, user_id: user_candidate2.id, status: 'pendente de avaliação')

    visit root_path
    login_as user_employee
    click_on "Ver Vagas de Emprego"
    click_on (job.name).to_s
    click_on "Ver Todas as Candidaturas dessa Vaga"

    expect(page).to have_content(user_candidate.name)
    expect(page).to have_content(job_apply.status)
  end
  scenario "in detail" do

    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')

    user_employee = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id, role: 'employee')
    
    user_candidate = User.create!(email: 'carla@email.com', password: '123456', role: 'candidate', name: "Carla", cpf: 12312312312)
    user_candidate2 = User.create!(email: 'marcos@email.com', password: '123456', role: 'candidate', name: "Marcos", cpf: 12312312312)
    
    job = Job.create!(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company: company)
    job2 = Job.create!(name: 'Vaga React', 
                      description: 'Uma Vaga React desafiadora', 
                      salary: '2000', 
                      level: 'Júnior', 
                      requirements: 'React, Git', 
                      expiration_date: '30/05/2021', 
                      qty_candidates: '4', company: company)
    
    job_apply = JobApplication.create!(job_id: job.id, user_id: user_candidate.id, status: 'pendente de avaliação')
    job_apply2 = JobApplication.create!(job_id: job2.id, user_id: user_candidate2.id, status: 'pendente de avaliação')

    visit root_path
    login_as user_employee
    click_on "Ver Vagas de Emprego"
    click_on (job.name).to_s
    click_on "Ver Todas as Candidaturas dessa Vaga"
    click_on user_candidate.name

    expect(page).to have_content(user_candidate.email)
    expect(page).to have_content(user_candidate.cpf)
    expect(page).to have_content(user_candidate.phone)
    expect(page).to have_content(user_candidate.biography)
  end

  scenario "and approve candiadte" do

    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')

    user_employee = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id, role: 'employee')
    
    user_candidate = User.create!(email: 'carla@email.com', password: '123456', role: 'candidate', name: "Carla", cpf: 12312312312)
    user_candidate2 = User.create!(email: 'marcos@email.com', password: '123456', role: 'candidate', name: "Marcos", cpf: 12312312312)
    
    job = Job.create!(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company: company)
    job2 = Job.create!(name: 'Vaga React', 
                      description: 'Uma Vaga React desafiadora', 
                      salary: '2000', 
                      level: 'Júnior', 
                      requirements: 'React, Git', 
                      expiration_date: '30/05/2021', 
                      qty_candidates: '4', company: company)
    
    job_apply = JobApplication.create!(job_id: job.id, user_id: user_candidate.id, status: 'pendente de avaliação')
    job_apply2 = JobApplication.create!(job_id: job2.id, user_id: user_candidate2.id, status: 'pendente de avaliação')

    visit root_path
    login_as user_employee
    click_on "Ver Vagas de Emprego"
    click_on (job.name).to_s
    click_on "Ver Todas as Candidaturas dessa Vaga"
    click_on user_candidate.name
    fill_in "Mensagem", with: "Parabéns, vc foi aprovado!"
    choose :form_status_true
    click_on "Enviar"

    expect(page).to have_content(user_candidate.nome)
    expect(page).to have_content(job_apply.status)
  end

end