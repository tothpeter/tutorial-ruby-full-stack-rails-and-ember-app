class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all

    render json: @companies
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    @company.contacts << (relationship_params[:contacts] || [])

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: { errors: [ @company.errors ] }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    @company.contacts = relationship_params[:contacts] if relationship_params[:contacts]

    if @company.update(company_params)
      render json: @company
    else
      render json: { errors: [ @company.errors ] }, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:data).require(:attributes).permit(
        :name, :phone, :email, :website, :address, :customer_id, :additional_info
      )
    end
end
