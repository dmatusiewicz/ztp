def print_owing
  print_banner
  outstanding = calculate_outstanding
  print_details(outstanding)
end

def calculate_outstanding
  @orders.inject(0.0) { |result, order| result + order.amount }
end
