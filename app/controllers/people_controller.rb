class PeopleController < ApplicationController
    def index
      @people = Person.all
      @person = Person.new
    end
  
    def create
      @person = Person.new(person_params)
      if @person.save
        redirect_to root_path
      else
        @people = Person.all
        render :index
      end
    end
  
    private
  
    def person_params
      params.require(:person).permit(:name, :occupation)
    end
  end
  