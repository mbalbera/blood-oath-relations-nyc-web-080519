require 'pry'

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

    def self.first_oath
        h = Hash.new(9999)
        self.all.each do |bloodoath|
            h[bloodoath.cult] = bloodoath.date if h[bloodoath.cult] > bloodoath.date
        end
    end


end

binding.pry