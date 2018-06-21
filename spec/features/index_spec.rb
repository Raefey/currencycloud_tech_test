feature 'Testing index' do
  scenario 'Can run and display recipient button' do
    visit('/')
    expect(page).to have_button 'Recipients'
  end
end

feature 'Testing index' do
  scenario 'Can run and display payment button' do
    visit('/')
    expect(page).to have_button 'Payments'
  end
end
