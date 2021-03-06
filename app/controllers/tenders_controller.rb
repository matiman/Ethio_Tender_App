class TendersController < ApplicationController


	before_filter :signed_in_user

  # GET /tenders
  # GET /tenders.json
  def index

  	    #if params[:status].nil?	    
	#	    @tenders = current_user.company.tender #display only the current user's company's tenders . There is a method called 'tender' in the tender model
	 #   else
	  #         
                    if(@tenders==nil)
		    @tenders= Tender.where("company_id= ? ", current_user.company.id).order('closing_date') 
		    #@tenders= Tender.where("company_id= ? AND status= ?", current_user.company.id, "Closed" ) 
			    #tender_by_company_and_status("Closed", current_user.company.id)
		    end

	  #  end
   



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenders }

    end
  end

  
  # GET /tenders/1
  # GET /tenders/1.json
  def show
	  
    @tender = Tender.find_by_id(params[:id])
   
    #This shit is not working ... when a user tries to find a tender that doesnt exist i want to show an error message and redirect back to root
    if @tender.nil?
	      flash[:error]="Couldn't find the specific tender"
	      redirect_to root_path

    end


    if !is_current_company
	    flash[:error]="Access denied!!"
	    redirect_to root_path

    else

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @tender }
      end
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
    params[:is_new]='false'
	  
    if !is_current_company
	    flash[:error]="Access denied!!"
	    redirect_to root_path

    else

    end
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Tender.new(params[:tender])


    @tender.company_id=current_user.company_id
    @tender.status="Initiated" #When a tender is first created its status is defaulted to intiated

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
        if !is_current_company
	    flash[:error]="Access denied!!"
	    redirect_to root_path

    else  


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
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy

	  
    @tender = Tender.find(params[:id])

        if !is_current_company
	    flash[:error]="Access denied!!"
	    redirect_to root_path

    else


    @tender.destroy

    respond_to do |format|
      format.html { redirect_to tenders_url }
      format.json { head :no_content }
    end
   end
  end


def order_by_bid_amount_ajax



    @tenders= Tender.where("company_id= ? ", current_user.company.id).order('bid_amount desc') 
    params[:bid_amount]="true"
    

    

    #I think this does not even have to be here
    respond_to do |format|
      format.html { render action: "index" }
      format.js
    end
  end




 	#should accessed from this controller for now????????????????????

#	calculate the difference between tender opened and closing date to display it on the table


	private 

#	Remaining date for the tenders
	def remaining_date(from_date,to_date) 
		distance_of_time_in_words(from_date, from_date)  
	end


#	This method is used by the show and edit actions to check if the current user is trying to see or edit other company's tender
	def is_current_company
		current_user.company_id==@tender.company_id

	end



end
