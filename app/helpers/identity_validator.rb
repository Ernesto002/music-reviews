class IdentityValidator < ActiveModel::Validator
  def validate(record)
    if record.identities.blank?
      if record.username.blank? && record.email.blank?
        record.errors[:missing_identity] << 'User must have at least one username, email, or social.'
      end
      record.errors[:invalid_password] << 'User must have a password.' if record.password_digest.blank?
    end
    record = enforce_unique(record)
  end
  
  def enforce_unique(record)
    username_id = User.find_by(username: record.username)&.id
    email_id = User.find_by(email: record.email)&.id
    record.errors[:username] << 'Username is already taken.' if !record.username.blank? && (!username_id.nil? && username_id != record.id)
    record.errors[:email] << 'Email is already taken.' if !record.email.blank? && (!email_id.nil? && email_id != record.id)
    record
  end
end