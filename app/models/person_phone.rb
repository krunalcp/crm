class PersonPhone < ApplicationRecord

  #
  # Validations
  #
  belongs_to :person
  # before_save :validate_phone
  #
  # Validations
  #

  validates(
    :phone,
     uniqueness: true
  )

  validate(
    :is_phone_valid?
  )

  def is_phone_valid?
    errors.add(:phone, "Phone Number Is Already Added") if self.person.person_phones.pluck(:phone).include?(self.phone)
  end

end
