module TheCity

  class UserListLoader < ApiLoader

    # Constructor.
    #
    # <b>options</b> A hash of options for requesting data from the server.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      page = options[:page] || 1
      @class_key = "user_list_#{page}"   
      @url_data_path = "/users"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end