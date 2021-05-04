class IdentityValidator < ActiveModel::Validator
    def validate(record)
        if record.identities.blank? 
            if record.username.blank? && record.email.blank? 
                record.errors[:base] << 'This user must have at least one username, email, or social link'
            end
            record.errors[:base] << 'Users must have a password' if record.password_digest.blank?
            record = enforce_unique(record)
        end
    end

    def enforce_unique(record)
        record.errors[:username] << 'Username is taken' if record.username && User.exists?(username: record.username)
        record.errors[:email] << 'Email is taken' if record.email && User.exists?(email: record.email)
        record
    end
end