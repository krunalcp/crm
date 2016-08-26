class PersonsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @persons = current_user.persons.all
  end

  def show
  end

  def new
    @person = current_user.persons.new
    @person.person_phones.build
    @person.person_emails.build
    @person.person_tags.build
  end

  def edit
  end

  def create
    @person = current_user.persons.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to persons_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_person
      @person = current_user.persons.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
                                :prefix_name,
                                :first_name,
                                :middle_name,
                                :last_name,
                                :suffix_name,
                                :user_id,
                                :address1,
                                :address2,
                                :state,
                                :city,
                                :zip1,
                                :zip2,
                                :gender,
                                :unsubscribe,
                                :person_tag_id,
                                person_phones_attributes: [
                                 :id,
                                 :phone,
                                 :phone_type
                                ],
                                person_emails_attributes: [
                                 :id,
                                 :email,
                                 :email_type
                                ],
                                person_tags_attributes: [
                                 :id,
                                 :tag_name,
                                 :tag_type
                                ]
                              )
    end
end
