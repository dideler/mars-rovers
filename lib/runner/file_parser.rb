module Runner
  class FileParser
    attr_reader :plateau_coordinates, :rover_data

    def self.call(*args)
      new(*args).call
    end

    def initialize(filepath)
      @filepath = filepath
    end

    def call
      @rover_data = []
      File.open(@filepath) do |f|
        @plateau_coordinates = f.readline.split

        while line = f.gets
          next if line == "\n"
          @rover_data << line.chomp
        end
      end
      self
    end
  end
end
