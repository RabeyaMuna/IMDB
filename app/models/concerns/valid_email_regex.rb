module ValidEmailRegex
  extend ActiveSupport::Concern

  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze
end
