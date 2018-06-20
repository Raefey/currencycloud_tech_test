feature 'Testing recipients page' do
  scenario 'Can List the Recipients' do
    visit('/')
    click_button('Login')
    expect(page).to have_content('raefe')
  end
end
