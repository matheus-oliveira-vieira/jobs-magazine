require 'rails_helper'

feature "Edit job" do
  scenario 'sucessfully' do
    company = Company.create!(name: 'Code4U', 
      address: 'Rua A 123', 
      cnpj: '92107397000133', 
      website: 'code4u.com', 
      founded: '2020')
    user = User.create!(email: 'matheus@code4u.com', password: '123456', company_id: company.id, role: 'employee')
    job = Job.create!(name: 'Vaga Ruby on Rails', 
                      description: 'Uma Vaga Ruby on Rails com desafios muito interessantes', 
                      salary: '2500', 
                      level: 'Júnior', 
                      requirements: 'Ruby on Rails, Git', 
                      expiration_date: '30/03/2021', 
                      qty_candidates: '10', company: company)

    
    login_as user
    visit root_path
    click_on "Ver Vagas de Emprego"
    click_on job.name
    click_on "Excluir Vaga"
    
    expect(current_path).to eq(root_path)
    expect(job_path(job)).not_to have_content('Vaga Ruby on Rails')
  end
end