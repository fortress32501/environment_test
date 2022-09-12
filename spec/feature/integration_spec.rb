# location: spec/feature/integration_spec.rb
require 'rails_helper'


RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Rowling'
    fill_in 'Price', with: 30.99
    select '2022', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '10', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'valid author' do
    visit new_book_path
    fill_in 'Title', with: 'test2'
    fill_in 'Author', with: 'author2'
    fill_in 'Price', with: 30.99
    select '2022', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '10', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('author2')

  end

  scenario 'valid price' do
  	visit new_book_path
    fill_in 'Title', with: 'test3'
    fill_in 'Author', with: 'author3'
    fill_in 'Price', with: 30.99
    select '2022', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '10', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
  	expect(page).to have_content('30.99')
  end

  scenario 'valid published_date' do
  	visit new_book_path
    fill_in 'Title', with: 'test4'
    fill_in 'Author', with: 'author4'
    fill_in 'Price', with: 30.99
    select '2022', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '10', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
  	expect(page).to have_content('2022-09-10')
  end
    
end
