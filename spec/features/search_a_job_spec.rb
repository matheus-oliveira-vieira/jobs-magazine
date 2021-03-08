require 'rails_helper'

feature 'Visit jobs page' do
  context 'and search for job' do
    scenario 'successfully' do
    
      Company.create!(name: 'Code4U', address: 'Rua A 123', 
                      cnpj: '92107397000133', website: 'code4u.com', founded: '2020')
                      
      Job.create!(name:'Vaga Ruby on Rails', description: 'Vaga de Ruby on Rails muito boa',
                  salary: 3000, level: 'Junior', requirements: 'Ruby, Rails, Git',
                  expiration_date: '20/03/2021', qty_candidates: 5, company_id: company.id)
      Job.create!(name:'Ruby on Rails no exterior', description: 'Vaga de Ruby on Rails para trabalhar nos EUA',
                  salary: 18000, level: 'Pleno', requirements: 'Ruby, Rails, Git', expiration_date: '20/03/2021',
                  qty_candidates: 5, company_id: company.id)
      Job.create!(name:'Vaga Javascript', description: 'Vaga de Javascript com um ótimo time de devs',
                  salary: 3000, level: 'Junior', requirements: 'Javascript, Node, Git', expiration_date: '20/03/2021',
                  qty_candidates: 10, company_id: company.id)

    visit root_path
    click_on 'Ver Vagas de Emprego'
    fill_in 'Busca:', with: 'Ruby'
    click_on 'Pesquisar'

    expect(current_path).to eq search_job_path
    expect(page).to have_content('Vaga Ruby on Rails')
    expect(page).to have_content('Vaga de Ruby on Rails muito boa')
    expect(page).to have_content('Ruby on Rails no exterior')
    expect(page).to have_content('Vaga de Ruby on Rails para trabalhar nos EUA')
    expect(page).not_to have_content('Vaga Javascript')
    expect(page).not_to have_content('Vaga de Javascript com um ótimo time de devs')
     end
  end
end