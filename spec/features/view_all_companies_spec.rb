require "rails_helper"

feature "view jobs" do
  scenario "successfully" do
    company1 = Company.create!(name: 'Code4U', 
                              address: 'Rua A 123', 
                              cnpj: '92107397000133', 
                              website: 'code4u.com', 
                              founded: '2020')
    company2 = Company.create!(name: 'DevsAtWork', 
                              address: 'Rua B 456', 
                              cnpj: '28255272000151', 
                              website: 'devsatwork.com', 
                              founded: '2010')
  visit root_path
  click_on "Ver Empresas"
    expect(page).to have_content(company1.name)
    expect(page).to have_content(company1.address)
    expect(page).to have_content(company1.website)
    expect(page).to have_content(company2.name)
    expect(page).to have_content(company2.address)
    expect(page).to have_content(company2.website)
  end

  scenario "and no jobs created" do

    visit root_path
    click_on "Ver Empresas"

    expect(page).to have_content("Nenhuma Empresa cadastrada")
  end

  scenario "and return to home page" do
    company = Company.create!(name: 'Code4U', 
                              address: 'Rua A 123', 
                              cnpj: '92107397000133', 
                              website: 'code4u.com', 
                              founded: '2020')
    visit root_path
    click_on "Ver Empresas"
    click_on "Voltar Para a página Inicial"

    expect(current_path).to eq root_path
    end
end