require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  # holiday_hash[season] ||= {}
  # holiday_hash[season][holiday_name] ||= []
  # holiday_hash[season][holiday_name] = supply_array
  # holiday_hash
  
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_array_supplies = []
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.collect do |season, holidays|
    if season == :winter
      holidays.collect do |holiday, attribute|
        winter_array_supplies.push(attribute)
      end
    end
  end
  winter_array_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    string = " "
    holiday.each do |holiday, supplies|
      
      string = "  #{holiday.to_s.split("_").map {|x| x.capitalize}.join(" ")}: "
      string += supplies.join(", ")

       puts string
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_with_bbq = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supplies|
      supplies.each do |x|
        if x == "BBQ"
          holiday_with_bbq.push(holiday)
        end
      end
    end
  end

  holiday_with_bbq
end







