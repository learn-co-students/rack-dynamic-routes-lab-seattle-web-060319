class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.params["q"]
      if @@items.include?(search_term)
        resp.write search_term.price
      else
        req.status = 400
        resp.write "Error. We ain't got it."
      end
end
    else
      req.status = 404
    end

    resp.finish
  end

end
