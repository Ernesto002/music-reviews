class IdentityValidator < ActiveModel::Validator
    def validate(record)
        if record.username.blank? && record.email.blank? && record.indentities.blank?
            record.errors[:base] << 'This user must have at least one username, email, or identity.'
        end
        if record.identities.blank? && record.password_digest.blank? 
            record.errors[:base] << 'Users must have a password'
        end
    end
end