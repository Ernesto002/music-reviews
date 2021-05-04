class IdentityValidator < ActiveModel::Validator
    def validate(record)
        if record.identities.blank? 
            if record.username.blank? && record.email.blank? 
                record.errors[:missing_identity] << 'User must have at least one username, email, or social link'
            end
            record.errors[:invalid_password] << 'Users must have a password' if record.password_digest.blank?
        end
        record = enforce_unique(record)
    end

    def enforce_unique(record)
        username_id = User.find_by(username: record.username)&.id
        email_id = User.find_by(email: record.email)&.id
        record.errors[:username] << 'Username is taken' if record.username && User.exists?(username: record.username)
        record.errors[:email] << 'Email is taken' if record.email && User.exists?(email: record.email)
        record
    end
end