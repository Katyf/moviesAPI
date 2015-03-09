class User < ActiveRecord::Base
  has_secure_password

  before_create :generate_token

  def generate_token
    return if token.present?
      self.token = SecureRandom.uuid.gsub(/\-/,'')
  end
end
