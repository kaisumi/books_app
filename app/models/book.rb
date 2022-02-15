class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  def testmethod
    
  end
end
