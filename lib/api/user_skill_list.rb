module TheCity

  class UserSkillList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserSkillListLoader] loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified skill.
    #
    # @param index The index of the skill to get.
    #
    # @return [UserSkill]
    def [](index)
      UserSkill.new( @json_data['skills'][index] ) if @json_data['skills'][index]
    end
  
  end
  
end