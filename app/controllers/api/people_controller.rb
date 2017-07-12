class Api::PeopleController < ApplicationController
  def auto_complete
    render json: Person.auto_complete(person_params[:q])
  end

  private

  def person_params
    params.permit(:q)
  end
end
