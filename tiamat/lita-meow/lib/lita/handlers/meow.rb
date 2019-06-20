require "pry"

module Lita
  module Handlers
    class Meow < Handler
      route /^meow\s+(?<num>\d+)/, :handle_meows
      http.get "/meow", :trigger_meow
      
      def handle_meows(response)
        num_meows = Integer(response.match_data[:num])
        num_meows.times do 
          response.reply("MEOW")
        end
      end
      
      
      def trigger_meow(request, response)
        response.body << "Hello, #{request.user_agent}!"
        robot.send_message(Source.new(room: "#thekitchen"), "Hello from user agent: #{request.user_agent}")
      end
      
      Lita.register_handler(self)
    end
  end
end
