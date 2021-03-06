class UsersController < ApplicationController
	before_filter :signed_in_user, only: [ :edit, :update, :destroy]
	before_filter :correct_user, only: [:edit, :update, :show]
	before_filter :admin_user, only: :destory



	def show
	  @user=User.find(params[:id])
	  @microposts = @user.microposts.paginate(page: params[:page])
	end

	def new
          @user=User.new
	  @@company=Company.find_by_id(session[:company]) #I need to get the company from the session so that the user will be registered to that company
	end

	def create
	#	@user = User.new(params[:user])
		@user = @@company.users.build(params[:user])

		if @user.save


			sign_in @user
			flash[:success] = "Welcome to Ethio Tender App! #{@@company.id}"
			redirect_to @user
		else
			render 'new'
		end
		
	end

	def edit		
	end

	def index
	@users=User.paginate(page: params[:page]) 
	end

	def update
		
		if @user.update_attributes(params[:user])
			flash[:success]= "Profile updated"
			sign_in @user
			redirect_to  @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_path

	end

	private

	    def admin_user
		    redirect_to(root_path) unless current_user.admin?
	    end
	end
	
