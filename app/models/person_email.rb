class PersonEmail < ApplicationRecord

  #
  # Association
  #
  belongs_to :person

  #
  # Validations
  #

  validates(
    :email,
     uniqueness: true,
  )
  
  validate(
    :is_email_valid?
  )

  def is_email_valid?
    errors.add(:email, "Email is Already Added") if self.person.person_emails.pluck(:email).include?(self.email)
  end
  

end
