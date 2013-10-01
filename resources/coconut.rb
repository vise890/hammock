# sample CRUD resource
class Coconut
  include Mongoid::Document
  field :name, type: String
  field :mass, type: Float
  field :juicy, type: Boolean
  field :keywords, type: Array
end
