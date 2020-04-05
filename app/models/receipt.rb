class Receipt < ApplicationRecord
  belongs_to :expense, optional: true
  mount_uploader :image, ReceiptUploader
end
