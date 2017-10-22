require 'bundler/setup'

require 'prawn'
require 'prawn/table'

require 'csv'

Prawn::Document.generate('table.pdf') do
  # puts "Prawn:DATADIR: #{Prawn::DATADIR}"
  font '/Users/wbzyl/.fonts/Roboto/Roboto-Regular.ttf'
  font_size 11

  if ARGV.length.zero?
    puts 'Usage: ruby code_smells.rb code_smells.csv'
    exit
  else
    csv_file = ARGV[0]
  end

  csv_data = open(csv_file).readlines
  body = CSV.parse(csv_data.join)

  table(
    body,
    header: true,
    width: 540,
    cell_style: {
      height: 36, padding: [12, 6, 12, 6], overflow: :shrink_to_fit
    }
  )
end

puts '--> table.pdf'
