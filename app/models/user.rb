class User < ActiveRecord::Base
  include Tokenizable

  dragonfly_accessor :image

  has_many :roles

  def has_role?(role)
    roles.where(role: Role.roles[role.to_s]).present?
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.find_for_omniauth(auth)
    User.where(provider: auth['provider'], uid: auth['uid'].to_s).first || User.create_for_omniauth(auth)
  end

  def self.create_for_omniauth(auth)
    user = User.where(provider: auth['provider'], uid: auth['uid'].to_s).first_or_create!
    user.update(
        first_name: auth['info']['first_name'] || "",
        last_name: auth['info']['last_name'] || "",
        email: auth['info']['email'] || "",
        image_url: auth['info']['image'] || ""
    )
    user
  end

end