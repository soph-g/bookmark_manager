feature 'Tagging links' do

  scenario 'add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'adventure'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to(include('adventure'))
  end

  scenario 'adds multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'adventure mystery'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to(include('adventure', 'mystery'))
  end
  end
