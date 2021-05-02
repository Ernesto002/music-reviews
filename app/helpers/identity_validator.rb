class IdentityValidator < ActiveModel::Validator
    def validate(record)
        if record.username.blank? && record.email.blank? && record.indentities.blank?
            record.errors[:base] << 'This user must have at least one username, email, or identity.'
        end
    end
end