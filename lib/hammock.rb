helpers do

  def get_resource(name)
    return @resource_class if @resource_class
    begin
      @resource_class = name.singularize.titleize.constantize
    rescue
      halt 404 # not found
    end
  end

  def resource_instance
    return @resource_instance if @resource_instance
    begin
      @resource_instance = get_resource(params[:resource_name]).find(params[:id])
    rescue
      halt 404 # not found
    end
  end

  def resource_args
    params[params[:resource_name].singularize]
  end

end

before do
  content_type :json
end

get '/' do
  Coconut.first.to_json
end

# CREATE
# E.g. POST /coconuts, { coconut: { name: 'Nutso', juicy: false, mass: 4.2, keywords: ['weird'] } }
# create a coconut with the specified arguments
post '/:resource_name' do
  new_resource_instance = get_resource(params[:resource_name]).new(resource_args)

  if new_resource_instance.save
    resource.to_json
  else
    halt 422 # unprocessable entity
  end
end

# READ
# E.g. GET /coconuts
# return all coconuts
get '/:resource_name' do
  get_resource(params[:resource_name]).all.to_json
end

# READ
# E.g. GET /coconuts/524a87a7e0f3fc1d2d000001
# return cocounut with _id = 524a87a7e0f3fc1d2d000001
get '/:resource_name/:id' do
  find_resource.to_json
end

# UPDATE
# E.g. PUT /coconuts/524a87a7e0f3fc1d2d000001
put '/:resource_name/:id' do
  if resource_instance.update_attributes(resource_args)
    resource_instance.to_json
  else
    halt 422 # unprocessable entity
  end
end

# DESTROY
# E.g. DELETE /coconuts/524a87a7e0f3fc1d2d000001
# delete cocounut with _id = 524a87a7e0f3fc1d2d000001
delete '/:resource_name/:id' do
  if resource_instance.destroy
    resource_instance.to_json
  end
end
