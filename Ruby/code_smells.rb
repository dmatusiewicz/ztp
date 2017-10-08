require 'bundler/setup'

require 'prawn'
require 'prawn/table'

require 'csv'
require 'pp'

Prawn::Document.generate('table.pdf') do
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

  cs = make_cell content: 'Code Smell'
  counter = make_cell content: 'Counter'

  index = 0
  counted = body.map do |row|
    index += 1
    row.unshift (index < 10 ? ' ' : '') + index.to_s
    row += [' ', ' ']
  end

  counted.unshift [cs, counter]

  table(
    counted,
    header: true,
    width: 540,
    column_widths: { 0 => 32 },
    cell_style: {
      height: 36, padding: [12, 6, 12, 6], overflow: :shrink_to_fit
    }
  )
end

puts '--> table.pdf'
# puts "Prawn:DATADIR: #{Prawn::DATADIR}"
