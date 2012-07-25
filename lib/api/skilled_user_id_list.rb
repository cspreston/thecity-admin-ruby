module TheCity

  class SkilledUserIdList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserListReader] reader The object that loaded the data.
    # @param options A hash of filters for loading the user list.
    # 
    # Options:
    #   :page - The page number to get.
    #
    #
    # Examples:
    #   SkilledUserIdList.new(reader, {:page => 3})
    #
    #   SkilledUserIdList.new(reader, {:page => 2})
    #    
    def initialize(reader, options = {}) 
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the user ids in the list.
    #
    # @return array of user ids.
    def all_user_ids
      return [] if @json_data['user_ids'].nil?
      @json_data['user_ids'].collect { |user_id| user_id }
    end
    alias :user_ids :all_user_ids
    
    
    # Get the specified skill.
    #
    # @param index The index of the skill to get.
    #
    # @return [User]
    def [](index)
      @json_data['user_ids'][index] if @json_data['user_ids'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['user_ids'].each{ |user_id| yield( user_id )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['user_ids'].empty?
    end    
  
  end
  
end
