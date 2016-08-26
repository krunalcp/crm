class Import < ApplicationRecord

# Paperclip
  attr_accessor  :upload_content_type

  #
  # Associations
  #
  belongs_to(
    :user,
    required: false
  )

  #
  # Validation
  #
  # has_attached_file(
  #   :upload
  # )

  validates(
    :user_id,
    presence: true
  )

  has_attached_file(
      :upload,
      default_url: "/excel_upload/:id_partition/:filename"
    )

  validates_attachment_content_type :upload, :content_type =>['application/xls', 'application/xlsx', 'application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'], :message => 'Only EXCEL files are allowed. '

end
