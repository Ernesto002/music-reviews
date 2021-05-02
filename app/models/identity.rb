class Identity < ApplicationRecord
  belongs_to :user

  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end

  def self.find_or_create_with_omniauth(auth)
    find_with_omniauth(auth) || create_with_omniauth(auth)
  end
end
