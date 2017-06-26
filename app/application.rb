class Application

  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)

   if req.path.include? "/items/"
     item_name = req.path.split("/items/").last

     @@items.find do |item|
       if item.name == item_name
         resp.write "#{item.price}"
         resp.status = 200
       else
         puts "#{item.name}"
         resp.write "Item not found"
         resp.status = 400
       end
     end

   else
     resp.write "Route not found"
     resp.status = 404
   end
   resp.finish
 end



end
