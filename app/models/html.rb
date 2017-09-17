class Html < ApplicationRecord
  validates :code, presence: true, length:{ is: 4 }
end
