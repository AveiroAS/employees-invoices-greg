class Document < ActiveRecord::Base
  belongs_to :user

  dragonfly_accessor :file

  validates_presence_of :user_id, :name, :amount
end
