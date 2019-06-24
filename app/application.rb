require 'pry'

class Application

  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      url_item = req.path.split("/").last

      found_item = @@items.find { |item| item.name == url_item }

      if found_item && found_item.name == url_item  
        resp.write found_item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end

end
