feature 'Testing recipients page' do
  scenario 'Can List the Recipients' do
    visit('/')
    click_button('Payments')
    expect(page).to have_content('john')
  end
end
