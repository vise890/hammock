helpers do

  def get_resource(name)
    begin
      name.singularize.titleize.constantize
    rescue
      halt 404
    end
  end

  def find_resource
    begin
      get_resource(params[:resource_name]).find(params[:id])
    rescue
      halt 404
    end
  end

end

before do
  content_type :json
end

get '/' do
  Coconut.first.to_json
end

# E.g. GET /coconuts
# return all coconuts
get '/:resource_name' do
  get_resource(params[:resource_name]).all.to_json
end

# E.g. GET /coconuts/524a87a7e0f3fc1d2d000001
# return cocounut with _id = 524a87a7e0f3fc1d2d000001
get '/:resource_name/:id' do
  find_resource.to_json
end

# E.g. DELETE /coconuts/524a87a7e0f3fc1d2d000001
# delete cocounut with _id = 524a87a7e0f3fc1d2d000001
delete '/:resource_name/:id' do
  find_resource.destroy.to_json
end
