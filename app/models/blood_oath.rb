class Bloodoath 
    attr_reader :date
    @@all = []

    def initialize(attribute)
        @date = attribute[:date]
        @cult = attribute[:cult]
        @follower = attribute[:follower]
        @@all << self
    end

    def initiation_date
        @date
    end

    def self.all
        @@all
    end 


end