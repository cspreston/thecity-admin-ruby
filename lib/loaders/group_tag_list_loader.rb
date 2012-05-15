module TheCity

  class GroupTagListLoader < ApiLoader

    # Constructor.
    #
    # <b>group_id</b> The group ID to load the tags for.
    # <b>page</b> The page number to get.  Default is 1. 
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(group_id, page = 1, cacher = nil)
      @class_key = "groups_#{group_id}_tags_#{page}"   
      @url_data_path = "/groups/#{group_id}/tags"
      @user_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end