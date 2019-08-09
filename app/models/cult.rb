require "pry"

class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :followers
    @@all = []

    def initialize(attributes)
        @name = attributes[:name]
        @location = attributes[:location]
        @founding_year = attributes[:founding_year]
        @slogan = attributes[:slogan]
        @followers = []
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(hash)
        hash[:cult] = self
        Bloodoath.new(hash)
    end

    def cult_population
        followers.count
    end

    def self.find_by_name(name)
        Cult.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(l)
        self.all.select do |c|
            c.location == l
        end
    end

    def self.find_by_founding_year(year)
        self.all.select do |c|
            c.founding_year == year
        end
    end
end

binding.pry