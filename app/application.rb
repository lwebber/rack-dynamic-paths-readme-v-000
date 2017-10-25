require_relative '../song.rb'

class Application

    @@songs = [Song.new("Sorry", "Justin Bieber"), Song.new("Hello","Adele")]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match("/songs/")
            song_title = req.path.split("/songs/").last
            song = @@songs.find {|s| s.title == song_title}
            resp.write "#{song.title}"

        # @@songs.each do |song|
        #     resp.write "#{song.title} by #{song.artist}\n"
        end
        resp.finish
    end

end