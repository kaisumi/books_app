require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'user creates a new book' do
    visit books_path
    click_link 'New book'
    fill_in 'Title', with: 'Test book title'
    fill_in 'Memo', with: 'Test book memo'
    fill_in 'Author', with: 'Test book author'
    # 画像をアップロードする
    expect {
      click_button 'Create Book'
      expect(page).to have_content 'Book was successfully created.'
      expect(page).to have_content 'Test book title'
      expect(page).to have_content 'Test book memo'
      expect(page).to have_content 'Test book author'
      # 画像が表示されていること
    }.to change(Book, :count).by(1)
  end
end
