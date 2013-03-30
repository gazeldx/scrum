class RegistersController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create, :edit]
  
  def index
    @registers = Register.order('created_at desc')
    render :layout => 'admin'
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
    @register = Register.find(params[:id])    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/new
  # GET /registers/new.json
  def new
    @register = Register.new
    @course = Course.find(params[:course_id].to_i)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/1/edit
  def edit
    @register = Register.find(params[:id])
  end

  def create
    @register = Register.new(params[:register])
    @course = Course.find(params[:course_id])
    @register.course = @course
    if @register.save
      redirect_to notice_path, :notice => t('register.create_succ')
    else      
      render :new
    end
  end

  # PUT /registers/1
  # PUT /registers/1.json
  def update
    @register = Register.find(params[:id])

    respond_to do |format|
      if @register.update_attributes(params[:register])
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register = Register.find(params[:id])
    @register.destroy

    respond_to do |format|
      format.html { redirect_to registers_url }
      format.json { head :no_content }
    end
  end
end
