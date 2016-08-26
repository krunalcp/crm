# frozen_string_literal: true
require 'roo'
require 'spreadsheet'
require 'roo-xls'
class ImportContactJob < ActiveJob::Base
  queue_as :default
  def perform(id)
    import = Import.find_by(id: id)
    puts "=----"
    puts import.id
    puts import.user_id
    # puts import.current_user.id
    puts "Job Started to insert Excel Data for store having id = #{import.id}"
    if import
      import.update(status: "I")
      spreadsheet = open_file(import.upload)
      header      = spreadsheet.row(1)
      new_header = header
      new_sheet = Spreadsheet::Workbook.new
      new_sheet.create_worksheet name: import.upload_file_name
      format = Spreadsheet::Format.new color: :blue,
                                       weight: :bold,
                                       size: 22,
                                       text_wrap: true
      new_sheet.default_format = format
      new_sheet.worksheet(0).insert_row(0, new_header.push("Errors"))
      success = 0
      failed  = 0
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i).push("Errors")].transpose]
        # row["User Name"] = current_user.id;
        new_import_data = Person.import_person_data(row,import.user_id)
        new_import_data_status =  new_import_data.split(",")
        new_row_index = new_sheet.worksheet(0).last_row_index + 1
        new_sheet.worksheet(0).insert_row(new_row_index, spreadsheet.row(i).push(new_import_data_status.join(",")))
        (new_import_data_status.size == 1 and new_import_data == "success" ) ? success = success + 1 : failed = failed + 1
        old_path = import.upload.path
        new_path = old_path.split("/")
        new_path.pop()
        temp_old_file_name = File.basename(import.upload.original_filename, ".*")
        new_file = "#{temp_old_file_name}_completed_#{import.id}.xls"
        new_sheet.write("#{new_path.join("/")}/#{new_file}")
        import.update(status: "P", total_record: (success + failed), number_of_success: success, number_of_failed: failed)
      end
    end
    puts "Job Ended to insert Excel Data for store having id = #{import.id}"
  end
  def open_file(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end