require "rails_helper"

feature "view jobs" do
  scenario "successfully" do
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
    job2 = Job.create!(name:'Vaga Javascript',
                description: 'Vaga de Javascript com um ótimo time de devs',
                salary: 3000,
                level: 'Junior',
                requirements: 'Javascript, Node, Git',
                expiration_date: '20/03/2021',
                qty_candidates: 10,
                company_id: company.id)
  visit root_path
  click_on "Ver Vagas de Emprego"
    expect(page).to have_content(job1.name)
    expect(page).to have_content(job1.description)
    expect(page).to have_content(job1.salary)
    expect(page).to have_content(job2.name)
    expect(page).to have_content(job2.description)
    expect(page).to have_content(job2.salary)
  end
  scenario "in detail" do
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
    click_on "Ver Vagas de Emprego"
    click_on (job1.name).to_s

    expect(page).to have_content(job1.name)
    expect(page).to have_content(job1.description)
    expect(page).to have_content(job1.salary)
    expect(page).to have_content(job1.level)
    expect(page).to have_content(job1.requirements)
    expect(page).to have_content(job1.expiration_date)
    expect(page).to have_content(job1.qty_candidates)
  end
end

#https://github.com/heartcombo/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-up-(registration)