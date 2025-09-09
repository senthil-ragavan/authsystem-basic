class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }, allow_blank: true

  def self.from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid) || find_by(email: auth.info.email)

    if user
      user.update(
        provider: auth.provider,
        uid: auth.uid,
        name: auth.info.name,
        image: auth.info.image
      )
    end
    user
  end
end
