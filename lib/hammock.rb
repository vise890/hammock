helpers do

  def get_resource(name)
    begin
      name.singularize.titleize.constantize
    rescue
      halt 404 # not found
    end
  end

  def find_resource
    begin
      get_resource(params[:resource_name]).find(params[:id])
    rescue
      halt 404 # not found
    end
  end

end

before do
  content_type :json
end

get '/' do
  Coconut.first.to_json
end

# CREATE
# E.g. POST /coconuts, { coconut: {} }
# create a coconut with the specified arguments
post '/:resource_name' do

  resource_args = params[params[:resource_name].singularize]
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

# DESTROY
# E.g. DELETE /coconuts/524a87a7e0f3fc1d2d000001
# delete cocounut with _id = 524a87a7e0f3fc1d2d000001
delete '/:resource_name/:id' do
  find_resource.destroy.to_json
end
