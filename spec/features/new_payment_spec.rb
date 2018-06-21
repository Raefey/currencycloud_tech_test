feature 'Testing recipients page' do
  scenario 'Can List the Recipients' do
    visit('/')
    click_button('Payments')
    click_button('New Payment')
    expect(page).to have_content('New Payment')
  end
end
