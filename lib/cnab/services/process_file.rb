module CNAB
  module Services
    class ProcessFile
      def initialize(
        parse_file: CNAB::Services::ParseFile.new
      )
        @parse_file = parse_file
      end

      def call(file)
        @parse_file.call(file)
      end
    end
  end
end
