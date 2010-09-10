class Task < ActiveRecord::Base
  acts_as_taggable
  validates_presence_of :description, :length, :user_id
  belongs_to :user
end
