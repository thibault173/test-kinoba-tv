class PagesController < ApplicationController
  def home
    @page = params[:page].to_i || 0
    @start_id = @page * 100 + 1
    @end_id = (@page + 1) * 100
    @tribe_members = TribeMember.includes(:ancestor).where(id: @start_id..@end_id)
    @number_of_results = TribeMember.count
    @markers = @tribe_members.map do |tribe_member|
      {
        lat: tribe_member.latitude,
        lng: tribe_member.longitude
      }
    end
  end
end
