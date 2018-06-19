feature 'Testing index' do
  scenario 'Can run and display page content' do
    visit('/')
    expect(page).to have_content 'Recipients'
  end
end
