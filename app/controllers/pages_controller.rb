class PagesController < ApplicationController
  def home
    set_params
    @tribe_members_result = search
    @number_of_results = @tribe_members_result.count
    @tribe_members_to_display = display
    set_markers
  end

  private

  def set_markers
    @markers = @tribe_members_to_display.map do |tribe_member|
      {
        lat: tribe_member.latitude,
        lng: tribe_member.longitude
      }
    end
  end

  def search
    scope = TribeMember.includes(:ancestor).all
    scope = scope.search_by_birthdate(Date.parse(params[:birthdate])) unless params[:birthdate].blank?
    scope = scope.search_by_name(params[:name]) if params[:name]
    scope = scope.search_by_surname(params[:surname]) if params[:surname]
    scope
  end

  def display
    scope = @tribe_members_result
    @page = params[:page].to_i || 0
    @first_result = @page * 100 + 1
    if (@page + 1) * 100 > @number_of_results
      @last_result = @number_of_results
    else
      @last_result = (@page + 1) * 100
    end
    scope = (scope - scope.first(@first_result - 1)).first(100)
    scope
  end

  def set_params
    @params = params.permit(:name, :surname)
  end
end
