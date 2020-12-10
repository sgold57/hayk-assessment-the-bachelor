require 'pry'

def all_contestants(data)
  contestants_all = []
  data.each do |season, contestants|
    contestants.each do |contestant|
      contestants_all << contestant
    end
  end
  contestants_all.flatten
end

def get_desired_season(data, season)
  data.find do |year, stats|
    year == season
  end
end

def get_first_name_of_season_winner(data, season)
  
  winner = get_desired_season(data, season)[1].find do |contestant|
    contestant["status"] == "Winner"
  end

  winner["name"].split[0]

end

def get_contestant_name(data, occupation)
  desired_person = all_contestants(data).find {|contestant| contestant["occupation"] == occupation}
  desired_person["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).count {|contestant| contestant["hometown"] == hometown}
end

def get_occupation(data, hometown)
  # code here
  desired_person = all_contestants(data).find {|contestant| contestant["hometown"] == hometown}
  desired_person["occupation"]
end

def get_average_age_for_season(data, season)
  # code here
  counter = 0.0
  age_combined = 0.0
  get_desired_season(data, season)[1].reduce(0) do |ages, contestant|
    counter += 1.0
    age_combined = (ages += (contestant["age"].to_f))
  end

  
  (age_combined / counter).round
end
