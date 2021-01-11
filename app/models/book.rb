class Book < ApplicationRecord
    mount_uploader :book, UploadFileUploader
    mount_uploader :image, ImageUploader
    def book_params
        params.fetch(:Book, {}).permit(:description)
      end
    
    def self.search(search)
    if term
      where('book_name LIKE ?', "%#{search}%")
    else
      order('id desc')
    end
  end
  def self.order_list(sort_order)
    if sort_order == "book_name"
      order(book_name: :desc)
    else
      order(created_at: :desc)
    end
  end
end
