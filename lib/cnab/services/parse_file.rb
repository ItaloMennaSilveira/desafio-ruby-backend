module CNAB
  module Services
    class ParseFile
      def initialize(
        parse_line: ::CNAB::Services::ParseLine.new
      )
        @parse_line = parse_line
      end

      def call(file_content)
        file_content.each_with_index do |line, _index|
          parse = @parse_line.call(line)


        end
      end
    end
  end
end
