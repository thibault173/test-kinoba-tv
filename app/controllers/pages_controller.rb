class PagesController < ApplicationController
  def home
    set_params
    @tribe_members_result = search
    @number_of_results = @tribe_members_result.count
    @tribe_members_to_display = display
    set_markers
    @ancestors_in_select2 = TribeMember.first(50) # performance problem with all db
  end

  private

  def set_markers
    @markers = @tribe_members_to_display
      .reject { |tribe_member| tribe_member.latitude.nil? }
      .map do |tribe_member|
        {
          lat: tribe_member.latitude,
          lng: tribe_member.longitude
        }
      end
  end

  def search
    scope = TribeMember.includes(:ancestor).all
    scope = scope.search_by_birthdate(Date.parse(params[:birthdate])) unless params[:birthdate].blank?
    scope = scope.search_by_ancestor_id(params[:ancestor_id]) unless params[:ancestor_id].blank?
    scope = scope.search_by_name(params[:name]) unless params[:name].blank?
    scope = scope.search_by_surname(params[:surname]) unless params[:surname].blank?
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
