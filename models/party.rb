class Party < ActiveRecord::Base
  has_many :item_orders
  belongs_to :server

  def self.calculate_receipt(orders)
    total = 0
    orders.each do |order|
      total += order.food.price
    end
    total
  end

  def self.convert_time(time)
    t = Time.parse(time)
    dayweek = t.wday
    month = t.month

    case dayweek
    when 0
      day = "Sunday"
    when 1
      day = "Monday"
    when 2
      day = "Tuesday"
    when 3
      day = "Wednesday"
    when 4
      day = "Thursday"
    when 5
      day = "Friday"
    when 6
      day = "Saturday"
    end

    case month
    when 1
      monthText = "January"
    when 2
      monthText = "February"
    when 3
      monthText = "March"
    when 4
      monthText = "April"
    when 5
      monthText = "May"
    when 6
      monthText = "June"
    when 7
      monthText = "July"
    when 8
      monthText = "August"
    when 9
      monthText = "September"
    when 10
      monthText = "October"
    when 11
      monthText = "November"
    when 12
      monthText = "December"
    end

    formattedDate = "#{day} #{monthText} #{t.day}, #{t.year}"
  end
end
