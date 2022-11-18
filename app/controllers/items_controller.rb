class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :check_admin_rights

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    if !@is_user_admin
      redirect_to admin_items_path
    end
  end

  # POST /items or /items.json
  def create
    redirect_to admin_items_path

    if !@is_user_admin
      return
    end

    @item = Item.new(item_params)

    @item.save

    flash[:notice] = @item.name + ' created'
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    redirect_to admin_items_path

    if !@is_user_admin
      return
    end

    @item.update(item_params)
    
    flash[:notice] = @item.name + ' updated'
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    redirect_to :admin_items

    if !@is_user_admin
      return
    end

    @item.destroy

    params[:id] = nil

    flash[:notice] = @item.name + " deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def check_admin_rights
      @is_user_admin = user_signed_in? && current_user.role == 'ADMIN'
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :price)
    end
end
