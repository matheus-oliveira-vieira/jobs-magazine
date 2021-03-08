require 'rails_helper'

feature 'Visit companies page' do
  context 'and search for company' do
    scenario 'successfully' do
      Company.create!(name: 'Code4U', address: 'Rua A 123', 
                      cnpj: '92107397000133', website: 'code4u.com', founded: '2020')
      Company.create!(name: 'Casa da Codificação', address: 'Rua B 456', 
                      cnpj: '92107397000133', website: 'casadacodificacao.com', founded: '1999')
      Company.create!(name: 'Master Programmers', address: 'Rua C 789', 
                      cnpj: '92107397000133', website: 'masterprogrammers.com', founded: '2012')
      
      visit root_path
      click_on 'Ver Empresas'
      fill_in 'Busca:', with: 'Cod'
      click_on 'Pesquisar'

      expect(current_path).to eq search_company_path
      expect(page).to have_content('Code4U')
      expect(page).to have_content('code4u.com')
      expect(page).to have_content('Casa da Codificação')
      expect(page).to have_content('casadacodificacao.com')
      expect(page).not_to have_content('Master Programmers')
      expect(page).not_to have_content('masterprogrammers.com')
    end
  end
end
    