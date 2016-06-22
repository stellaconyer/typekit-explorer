module Formatter
  class Kit
    attr_reader :name, :families

    def initialize(unformatted_kit:)
      @name = unformatted_kit[:name]
      @families = unformatted_kit[:families]
    end

    def format
      output = ""
      output << formatted_name
      output << formatted_families
    end

    private

    def formatted_name
      "Kit name: #{name}\n"
    end

    def formatted_families
      families.reduce("Families:\n") { |output, family| output << "#{family}\n" }
    end
  end
end
