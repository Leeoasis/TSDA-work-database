class PeopleController < ApplicationController
  def index
    @people = Person.all
    @person = Person.new
    @occupations = Person.pluck(:occupation).uniq.sort
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to root_path
    else
      @people = Person.all
      @occupations = Person.pluck(:occupation).uniq.sort
      render :index
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :occupation, :phone_number)
  end
 
end
