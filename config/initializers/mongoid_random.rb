def random_object(klass)
    klass.skip(rand(klass.count)).first
end

module Randomizer
    def self.random
        random_object(self)
    end
end
