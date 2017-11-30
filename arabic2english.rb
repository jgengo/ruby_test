#!/usr/bin/env ruby

class ArabicToEnglish
  attr_accessor :ret


  # === frozen const
  BASICS =  {
    1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
    5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
    10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
    15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
  }.freeze

  ADVANCED = {
    2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty',
    6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety'
  }.freeze

  UNITS = { 1 => 'thousand', 2 => 'million', 3 => 'billion' }.freeze


  # === init
  def initialize
    @ret = ''
  end


  # === public
  def translate(number)
    raise ArgumentError, 'Argument is not an Integer' unless /^(-?)\d+$/ =~ number
    number = number.to_i
    raise ArgumentError, 'Argument should be a value between 0 and 999999999999' unless number >= 0 and number <= 999999999999

    return "zero" if number == 0

    array = parse_number(number)

    array.each_with_index do |value, i|
      @ret += "#{BASICS[value / 100]} hundred " if value / 100 > 0
      ten(value % 100) if value % 100 > 0
      @ret += " #{UNITS[i]} " if UNITS.key?(i)

      array[i] = @ret.strip
      @ret = ''
    end

    array.reverse.join(' ').squeeze(' ')
  end


  # === private
  private def ten(n)
    @ret += BASICS[n] and return if BASICS.key?(n)
    @ret += "#{ADVANCED[n/10]} "
    @ret += BASICS[n%10] if n%10 != 0
  end

  def parse_number(n)
    n.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1 ').reverse.split.reverse.map(&:to_i)
  end

end

# === main
if __FILE__ == $0
  if ARGV[0]
    puts ArabicToEnglish.new.translate ARGV[0]
  else
    puts "usage: ./arabic2english.rb number"
  end
end