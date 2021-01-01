class Api::V1::ClientsController < Api::V1::ApiController
 
  before_action :setClient, only: [:show, :update, :destroy]
  
  before_action :require_authorization!, only: [:show, :update, :destroy]
  
  # GET /api/v1/clients
  
  def index
  
    @clients = current_user.clients
  
    render json: @clients
  
  end
  
  # GET /api/v1/clients/1
  
  def show
  
    render json: @client
  
  end
  
  # POST /api/v1/clients
  
  def create
  
    @client = Client.new(clientParams.merge(user: current_user))
  
    if @client.save
  
      render json: @client, status: :created
  
    else
  
      render json: @client.errors, status: :unprocessable_entity
  
    end
  
  end
  
  # PATCH/PUT /api/v1/clients/1
  
  def update
  
    if @client.update(clientParams)
  
      render json: { message: "Updated with succes", client: @client }
  
    else
  
      render json: @client.errors, status: :unprocessable_entity
  
    end
  
  end
  
  # DELETE /api/v1/clients/1
  
  def destroy
  
    @client.destroy
      render json: { message: "Deleted", client: @client }


  end
  
  private
  
    # Use callbacks to share common setup or constraints between actions.
  
    def setClient
  
      @client = Client.find(params[:id])
  
    end
  
    # Only allow a trusted parameter "white list" through.
  
    def clientParams
  
      params.require(:client).permit(:name, :email, :phone, :description)
  
    end
  
    def require_authorization!
  
      unless current_user == @client.user
  
        render json: {}, status: :forbidden
  
      end
  
    end
  
 end