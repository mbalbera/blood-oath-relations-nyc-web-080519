
require "pry"

class Follower

    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def initialize(attributes)
        @name = attributes[:name]
        @age = attributes[:age]
        @life_motto = attributes[:life_motto]
        @cults = []

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
end
binding.pry
