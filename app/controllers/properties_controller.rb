class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property
                  .includes(:property_type)
                  .paginate(page: params[:page], per_page: 5)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property_types = PropertyType.enabled
    @features = Feature.all
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @property_types = PropertyType.enabled
    @features = Feature.all
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        # Verify whether features array comes in the parameters list
        if params[:features].present? && !params[:features].empty?
          # Iterate through all features added to property
          for i in 0..params[:features].count - 1
            # Skip saving those features that has no quantity
            next if params[:quantities][i].empty? || params[:quantities][i].to_i <= 0

            # Create new features properties
            @property.features_properties.create!(
              feature_id: params[:features][i],
              property: @property,
              quantity: params[:quantities][i].to_i
            )
          end
        end

        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.includes(:property_type).friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :property_type_id, :description)
    end
end
