class Blog < ApplicationRecord
  has_many :comments, depend: :destroy
end
