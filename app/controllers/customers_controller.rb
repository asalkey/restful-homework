class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    render json: @customers
  end

  def list
    @customers = Customer.where("id >= ?", params[:id]).limit(params[:amount])
    render json: @customers
  end


  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    render json: @customer
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      head :no_content
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    head :no_content
  end

  private

    def customer_params
      params.require(:customer).permit(:firstname, :lastname, :street, :state, :zip, :country)
    end
end
