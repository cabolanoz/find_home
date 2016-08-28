class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    search = params[:search]

    if search.present?
      @properties = Property
                    .includes(:property_type)
                    .joins(:property_type)
                    .where(
                      'title ILIKE ? OR property_types.name ILIKE ? OR description ILIKE ?',
                      "%#{search}%",
                      "%#{search}%",
                      "%#{search}%"
                    )
                    .order(:title)
                    .paginate(page: params[:page], per_page: 5)
    else
      @properties = Property
                    .includes(:property_type)
                    .order(:title)
                    .paginate(page: params[:page], per_page: 5)
    end
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
    @property_types = PropertyType.enabled
    @features = Feature.all

    respond_to do |format|
      if @property.save
        # Get features parameter
        features = params[:features]

        # Verify whether features array comes in the parameters list
        if features.present?
          # Intantiate & create features by property
          features_property_create = FeaturesPropertyCreate.new(@property)
          features_property_create.create(features, params[:quantities])
        end

        # Get photos parameter
        photos = params[:photos]

        # Verify whether photos array comes in the parameters list
        if photos.present?
          # Intantiate & create photos by property
          photo_create = PhotoCreate.new(@property)
          photo_create.create(photos)
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
        # Get features parameter
        features = params[:features]

        # Verify whether features array comes in the parameters list
        if features.present?
          # Remove all features by property objects
          @property.features_properties.delete_all

          # Intantiate & create features by property
          features_property_create = FeaturesPropertyCreate.new(@property)
          features_property_create.create(features, params[:quantities])
        end

        # Get photos parameter
        photos = params[:photos]

        # Verify whether photos array comes in the parameters list
        if photos.present?
          # Remove all photos by property objects
          @property.photos.delete_all

          # Intantiate & create photos by property
          photo_create = PhotoCreate.new(@property)
          photo_create.create(photos)
        end

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
    @property.photos.delete_all
    @property.features_properties.delete_all
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property
                  .includes(:property_type, {features_properties: [:feature]}, :photos)
                  .friendly
                  .find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :property_type_id, :description)
    end
end
