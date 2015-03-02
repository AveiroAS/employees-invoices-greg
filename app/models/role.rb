class Role < ActiveRecord::Base
  enum role: [:accounting, :ceo, :employee]

  validates_presence_of :role, :user_id
  validates_uniqueness_of :role, scope: :user_id

  belongs_to :user
end