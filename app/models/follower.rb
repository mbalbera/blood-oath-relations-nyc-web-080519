
require "pry"

class Follower

    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def initialize(attributes)
        @name = attributes[:name]
        @age = attributes[:age]
        @life_motto = attributes[:life_motto]

        @@all << self
    end

    def self.all
        @@all
    end

    def join_cult(hash)
        hash[:follower] = self
        Bloodoath.new(hash)
    end

    def self.of_a_certain_age(age)
        self.all.select{ |member| member.age >= age}
    end

    def cults
        Bloodoath.all.select do |bloodoath|
            bloodoath.follower == self
        end
    end

    def my_cults_slogans
        cults.each do |cult|
            puts cult.slogan
        end
    end

    def self.most_active
        h = Hash.new(0)
        self.all.each do |follower|
            h[follower.name] += 1
        end
        h.max_by {|k, v| v}[0] 
    end

    def self.top_ten
        h = Hash.new(0)
        self.all.each do |follower|
            h[follower.name] += 1
        end
        h.sort_by do |f , count|
            count
        end[0..9][0]

    end
end
binding.pry
