class Person < ApplicationRecord
  self.table_name = 'persons'
  #
  # Associations
  #
  belongs_to :user

  has_many(
    :person_emails
  )

  has_many(
    :person_phones
  )

  has_many(
    :person_tags
  )
  
  accepts_nested_attributes_for(
    :person_phones,
    :person_emails,
    :person_tags
  )
  
  #
  # Validations
  #

  validates_associated :person_phones
  validates(
    :first_name,
    presence: true,
     length: {
      maximum: 64
    }
  )

  validates(
    :prefix_name,
    presence: true,
     length: {
      maximum: 8
    }
  )

  validates(
    :suffix_name,
    presence: true,
     length: {
      maximum: 8
    }
  )

  validates(
    :last_name,
    presence: true,
     length: {
      maximum: 64
    } 
  )

  validates(
    :middle_name,
    presence: true,
     length: {
      maximum: 1
    } 
  )

  validates(
    :city,
    presence: true,
     length: {
      maximum: 64
    } 
  )

  validates(
    :state,
    presence: true,
     length: {
      maximum: 2
    } 
  )

  validates(
    :zip1,
    presence: true,
     length: {
      maximum: 4
    } 
  )

  validates(
    :zip2,
    presence: true,
     length: {
      maximum: 5
    } 
  )

  validates(
    :gender,
    presence: true,
    inclusion: { in: %w(M F) }
  )

  validates(
    :user_id,
    presence: true
  )

  def self.import_person_data(row,current_userid)
    person_data ={
      prefix_name: row["Prefix Name"],
      first_name:  row["First Name"],
      middle_name: row["Middle Name"],
      last_name:   row["Last Name"],
      suffix_name: row["Suffix Name"],
      user_id:     current_userid,
      address1:    row["Address1"],
      address2:    row["Address2"],
      state:       row["State"],
      city:        row["City"],
      zip1:        row["Zip 1"],
      zip2:        row["Zip 2"],
      gender:      row["Gender(Male/Female"].to_s.downcase == "male" ? "M" : "F",
      unsubscribe: row["Unsubscribe"],
      person_phones_attributes: [
       phone:      row["Phone Number"],
       phone_type: row["Phone Number Type"]
      ],
      person_emails_attributes: [
       email:      row["Email"],
       email_type: row["Email Type"]
      ],
      person_tags_attributes: [
       tag_name:   row["Tag Name"],
       tag_type:   row["Tag Type"]
      ]
    }
    person = Person.new(person_data)
    if person.save
      return "success"
    else
      return person.errors.full_messages.join(",")
    end
  end
end
