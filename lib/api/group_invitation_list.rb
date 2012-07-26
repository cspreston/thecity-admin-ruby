module TheCity

  class GroupInvitationList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :group_id - The ID of the group to load the invitations for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   GroupInvitationList.new({:group_id => 12345})
    #
    #   GroupInvitationList.new({:group_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::GroupInvitationListReader.new(options)    
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified invitation.
    #
    # @param index The index of the invitation to get.
    #
    # @return [GroupInvitation]
    def [](index)
      GroupInvitation.new( @json_data['invitations'][index] ) if @json_data['invitations'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['invitations'].each{ |invitation| yield( GroupInvitation.new(invitation) )}
    end    
  

    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['invitations'].empty?
    end

  end
  
end
