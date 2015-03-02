module Tokenizable
  extend ActiveSupport::Concern

  included do
    after_create :generate_token
    before_validation :set_token, only: [:create]

    validates :token, presence: true

    def auth_token
      if token.present?
        token
      else
        set_token
        self.reload
        token
      end
    end

    private
    def set_token
      return if token.present?
      self.token = generate_token
    end

    def generate_token
      loop do
        token = SecureRandom.hex(32)
        break token unless self.class.exists?(token: token)
      end
    end

  end
end