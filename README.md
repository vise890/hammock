# Hammock
Leisurely build Restful APIs with ruby, sinatra and MongoDB.

# Useageness
Put a Mongoid document in the `resources` folder. That's it. You now have all the basic CRUD actions at `/resource_name`.

For example, if you put this in `resources/coconut.rb`:

```ruby
class Coconut
  include Mongoid::Document
  field :name, type: String
  field :juicy, type: Boolean
end
```

... you could then:

- `GET /coconuts` to get all the coconuts
- `GET /coconuts/524a87a7e0f3fc1d2d000001` to get that specific coconat
- `POST /coconuts, { name: 'Mr. Brown', juicy: true }` to create a new coconut
- `PUT /coconuts/524a87a7e0f3fc1d2d000001, { name: 'Nutty' }` to update the coconut
- `DELETE /coconuts/524a87a7e0f3fc1d2d000001` to disintegrate that coconut

Bonus route:
- `POST /coconuts/search, { juicy: true }` to find all the juicy coconuts

# Not Implemented yet
- Create
- Delete
- Update
- Search
- nested resources (meh.)
