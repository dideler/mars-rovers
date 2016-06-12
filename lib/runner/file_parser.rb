module Runner
  class FileParser
    def initialize(filepath)
      @filepath = filepath
    end

    def plateau_coordinates
      File.open(@filepath) { |f| f.readline.chomp.split.map(&:to_i) }
    end
  end
end
