module Formatter
  class Kits
    attr_reader :kits

    def initialize(unformatted_kits:)
      @kits = unformatted_kits
    end

    def format
      kits.reduce("Your kits:\n") { | output, kit | output << "#{kit}\n" }
    end
  end
end
