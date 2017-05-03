class ServiceTemplatesController < ApplicationController
  before_action :set_service_template, only: [:show, :edit, :update, :destroy]

  # GET /service_templates
  # GET /service_templates.json
  def index
    @service_templates = ServiceTemplate.page params[:page]
  end

  # GET /service_templates/1
  # GET /service_templates/1.json
  def show
  end

  # GET /service_templates/new
  def new
    @service_template = ServiceTemplate.new
  end

  # GET /service_templates/1/edit
  def edit
  end

  # POST /service_templates
  # POST /service_templates.json
  def create
    @service_template = ServiceTemplate.new(service_template_params)

    respond_to do |format|
      if @service_template.save
        format.html { redirect_to @service_template, notice: 'Service template was successfully created.' }
        format.json { render :show, status: :created, location: @service_template }
      else
        format.html { render :new }
        format.json { render json: @service_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_templates/1
  # PATCH/PUT /service_templates/1.json
  def update
    respond_to do |format|
      if @service_template.update(service_template_params)
        format.html { redirect_to @service_template, notice: 'Service template was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_template }
      else
        format.html { render :edit }
        format.json { render json: @service_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_templates/1
  # DELETE /service_templates/1.json
  def destroy
    @service_template.destroy
    respond_to do |format|
      format.html { redirect_to service_templates_url, notice: 'Service template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_template
      @service_template = ServiceTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_template_params
      params.require(:service_template).permit(:name, :icon, :group_id, :user_id, :raw_config, :desc, :readme)
    end
end