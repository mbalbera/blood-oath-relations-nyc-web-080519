require "pry"

class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :followers
    attr_reader :minimum_age
    @@all = []

    def initialize(attributes)
        @name = attributes[:name]
        @location = attributes[:location]
        @founding_year = attributes[:founding_year]
        @slogan = attributes[:slogan]
        @minimum_age = attributes[:minimum_age] ||= 0
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(attributes)
        attributes[:cult] = self
        if attributes[:follower][:age] > self.minimum_age
            Bloodoath.new(attributes) 
        end
    end

    def followers
         Bloodoath.all.select do |bos|
            bos.cult == self
         end
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

    def average_age
       total = 0.0
        followers.each do |follower|
            total += follower.age
        end
        total / cult_population
    end

    def my_followers_mottos
        followers.each do |follower|
            puts follower.life_motto
        end
    end

    def self.least_popular
        least = self.first
        self.all.each do |cult|
            if cult.cult_population > least.cult_population
                least = cult
            end
        end
        return least
    end

    def self.most_common_location
        h = Hash.new(0)
        self.all.each do |cult|
            h[cult.location]+= 1
        end
        h.max_by{ |k,v| v }
    end 



    
end

binding.pry