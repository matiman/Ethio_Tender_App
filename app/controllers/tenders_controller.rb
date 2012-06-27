class TendersController < ApplicationController


	before_filter :signed_in_user

  # GET /tenders
  # GET /tenders.json
  def index
    if signed_in?	  
	    @tenders = current_user.company.tender #display only the current user's company's tenders . There is a method called 'tender' in the tender model
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenders }
    end
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show

# TODO	  We only want to see if that tender id belongs to a company
	  
    @tender = Tender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tender }
    end
  end

  # GET /tenders/new
  # GET /tenders/new.json
  def new
    @tender = Tender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tender }
    end
  end

 #  TODO Same thing here edit only current companies tenders
  # GET /tenders/1/edit
  def edit
    
    @tender = Tender.find(params[:id])
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Tender.new(params[:tender])

#    TODO Add company id to the tender .. 
    @tender.company_id=current_user.company_id

    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: 'Tender was successfully created.' }
        format.json { render json: @tender, status: :created, location: @tender }
      else
        format.html { render action: "new" }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tenders/1
  # PUT /tenders/1.json
  def update
    @tender = Tender.find(params[:id])

    respond_to do |format|
      if @tender.update_attributes(params[:tender])
        format.html { redirect_to @tender, notice: 'Tender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender = Tender.find(params[:id])
    @tender.destroy

    respond_to do |format|
      format.html { redirect_to tenders_url }
      format.json { head :no_content }
    end
  end


 	#should accessed from this controller for now????????????????????

#	calculate the difference between tender opened and closing date to display it on the table
	def remaining_date(from_date,to_date) 
		distance_of_time_in_words(from_date, from_date)  
	end



end
