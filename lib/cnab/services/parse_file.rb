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

          shop = Shop.where(name: parse.data[:shop_name])
                     .first_or_create!(
                       name: parse.data[:shop_name]
                     )

          Beneficiary.where(cpf: parse.data[:cpf])
                     .first_or_create!(
                       name: parse.data[:shop_owner],
                       cpf: parse.data[:cpf],
                       shop_id: shop.id
                     )

          Transaction.create!(
            transaction_type: parse.data[:type],
            occurrence_date: parse.data[:occurrence_date],
            value: parse.data[:value],
            credit_card: parse.data[:card],
            hour: parse.data[:hour],
            shop_id: shop.id
          )
        end
      end
    end
  end
end
