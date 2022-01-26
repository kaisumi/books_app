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
    attach_file 'Picture', "#{Rails.root}/spec/files/lena.jpeg"
    expect {
      click_button 'Create Book'
      expect(page).to have_content 'Book was successfully created.'
      expect(page).to have_content 'Test book title'
      expect(page).to have_content 'Test book memo'
      expect(page).to have_content 'Test book author'
      expect(page).to have_selector "img[src$='lena.jpeg']"
    }.to change(Book, :count).by(1)
  end

  scenario 'user edits a book' do
    FactoryBot.create(:book)
    visit books_path
    click_link 'Show this book'
    click_link 'Edit this book'
    fill_in 'Title', with: 'Edited title'
    fill_in 'Memo', with: 'Edited memo'
    fill_in 'Author', with: 'Edited author'
    attach_file 'Picture', "#{Rails.root}/spec/files/fruits.jpeg"
    expect { 
      click_button 'Update Book'
      expect(page).to have_content 'Book was successfully updated.'
      expect(page).to have_content 'Edited title'
      expect(page).to have_content 'Edited memo'
      expect(page).to have_content 'Edited author'
      expect(page).to have_selector "img[src$='fruits.jpeg']"
    }.to_not change(Book, :count)
  end

  scenario 'user destroys a book' do
    FactoryBot.create(:book)
    visit books_path
    click_link 'Show this book'
    expect {
      click_button 'Destroy this book'
      expect(page).to  have_content 'Book was successfully destroyed.'
    }.to change(Book, :count).by(-1)
  end
end
