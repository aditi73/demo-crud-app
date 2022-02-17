class Post < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :title, :description, presence: true

end
