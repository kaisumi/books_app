FactoryBot.define do
  factory :book do
    title { 'Test book title' }
    memo { 'Test book memo' }
    author { 'John Doe' }
    picture { "#{Rails.root}/spec/files/lena.jpeg" }
  end
end
