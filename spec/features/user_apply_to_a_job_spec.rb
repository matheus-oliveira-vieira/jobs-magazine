require "rails_helper"

feature "apply to a job" do
  scenario "successfully" do
    user = User.create!(email: 'matheus@email.com', password: '123456', role: 'candidate')
    company = Company.create!(name: 'Code4U', 
                              address: 'Rua A 123', 
                              cnpj: '92107397000133', 
                              website: 'code4u.com', 
                              founded: '2020')
    job1 = Job.create!(name:'Vaga Ruby on Rails',
                description: 'Vaga de Ruby on Rails muito boa',
                salary: 3000,
                level: 'Junior',
                requirements: 'Ruby, Rails, Git',
                expiration_date: '20/03/2021',
                qty_candidates: 5,
                company_id: company.id)
    visit root_path
    login_as user
    click_on "Ver Vagas de Emprego"
    click_on job1.name
    click_on "Candidatar-se a Vaga"
    expect(page).to have_content(job1.name)
    expect(page).to have_content('pendente de avaliação')
  end
end