feature 'Testing index' do
  scenario 'Can run and display button' do
    visit('/')
    expect(page).to have_button 'Login'
  end
end
