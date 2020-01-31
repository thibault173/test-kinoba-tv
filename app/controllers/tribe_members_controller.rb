class TribeMembersController < ApplicationController
  def new
    @tribe_member = TribeMember.new
  end

  def create
    @tribe_member = TribeMember.new(
      tribe_member_params.merge(birthdate: Date.parse(params[:tribe_member][:birthdate]).strftime("%d/%m/%Y"))
    )
    raise
    if @tribe_member.save
      geocode_address
      redirect_to root_path
      flash[:notice] = "New tribe member : #{@tribe_member.full_name}"
    else
      render :new
    end
  end

private

  def tribe_member_params
    params.require(:tribe_member).permit(:name, :surname, :ancestor_id)
  end

  def geocode_address
    address = params[:tribe_member][:address].values.join('+')
    coordinates = ReturnCoordinates.call(address)
    @tribe_member.update(
      latitude: coordinates[:lat],
      longitude: coordinates[:lon]
    ) if coordinates
  end
end
