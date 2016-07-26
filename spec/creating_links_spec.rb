feature 'Creating links' do

  scenario 'creating a new link' do
    visit '/links/new'
    fill_in 'url', with: "http://www.google.co.uk"
    fill_in 'title', with: "Google"
    click_button("Create link")
    expect(current_path).to(eq('/links'))
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

end
