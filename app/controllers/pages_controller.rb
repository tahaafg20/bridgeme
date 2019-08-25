class PagesController < ApplicationController
  def home
   if !params[:search1].nil? 
   
    @rooms=Room.search params[:search1], fields: [:address,:summary,:listing_name]
    @educations=Education.search params[:search1], fields: [:name,:accepted_documents,:address,:services]
    @healths=Health.search params[:search1], fields: [:name,:accepted_documents,:address,:services]
    @communities=Community.search params[:search1], fields: [:name,:accepted_documents,:address,:services, :country]
    @ngos=Ngo.search params[:search1], fields: [:name,:accepted_documents,:address,:services]
    @posts = Post.search params[:search1], fields: [:content]
  
  else
    @rooms = Room.where(active: true).limit(3)
    @educations=Education.limit(1)
    @healths=Health.limit(1)
    @communities=Community.limit(1)
    @ngos=Ngo.limit(1)
    @posts = Post.all
   end
    
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @rooms_address = Room.where(active: true).all
    end

    # STEP 3
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result
    @posts = Post.all
    @arrRooms = @rooms.to_a

    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|

        not_available = room.reservations.where(
          "((? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date))
          AND status = ?",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date,
          1
        ).limit(1)

        not_available_in_calendar = Calendar.where(
          "room_id = ? AND status = ? AND day <= ? AND day >= ?",
          room.id, 1, end_date, start_date
        ).limit(1)

				if not_available.length > 0 || not_available_in_calendar.length > 0
  				@arrRooms.delete(room)
  			end
      end
    end

  end
end