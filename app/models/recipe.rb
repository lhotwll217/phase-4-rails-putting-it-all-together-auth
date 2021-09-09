class Recipe < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :instructions, :user_id
  validates_length_of :instructions, :minimum => 50
end
