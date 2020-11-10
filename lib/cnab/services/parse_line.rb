module CNAB
  module Services
    class ParseLine
      def initialize(
        cnab_line: CNAB::Readers::CnabFileLine
      )
        @cnab_line = cnab_line
      end

      def call(line)
        @cnab_line.new(line)
      end
    end
  end
end
