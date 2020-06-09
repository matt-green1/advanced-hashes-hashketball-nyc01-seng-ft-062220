# Write your code below game_hash
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          if player_hash_element.has_value?(player_name)
            return player_hash_element[:points]
          end
        }
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          if player_hash_element.has_value?(player_name)
            return player_hash_element[:shoe]
          end
        }
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_value == team_name 
        return outer_value[:colors]
      end
    }
  }
end

def team_names
  team_names = []
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :team_name
        team_names.push(outer_value[:team_name])
      end
    }
  }
  return team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if outer_value[:team_name] == team_name
        if middle_key == :players
          middle_value.each{|player_hash_element|
            jersey_numbers.push(player_hash_element[:number])
          }
        end
      end
    }
  }
  return jersey_numbers
end

def player_stats(player_name)
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          if player_hash_element.has_value?(player_name)
            return player_hash_element
          end
        }
      end
      
    }
  }
end

def num_rebounds(player_name)
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          if player_hash_element.has_value?(player_name)
            return player_hash_element[:rebounds]
          end
        }
      end
    }
  }
end


def big_shoe_rebounds
  biggest_shoe_size = 0
  player_name_list = []
  
  #creates player name array
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          player_name_list.push(player_hash_element[:player_name])
        }
      end
      
    }
  }
  
  #finds biggest shoe size
  player_name_list.each {|player_name|
    if shoe_size(player_name) > biggest_shoe_size
      biggest_shoe_size = shoe_size(player_name)
    end
  }
  
  #finds player to match largest shoe size and outputs rebound number for player
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          if player_hash_element[:shoe] == biggest_shoe_size
            return player_hash_element[:rebounds]
            
          end
        }
      end
    }
  }
end


def most_points_scored
  most_points_scored = 0
  player_name_list = []
  
  #creates player name array
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          player_name_list.push(player_hash_element[:player_name])
        }
      end
    }
  }
  
  #finds most points scored
  player_name_list.each {|player_name|
    if num_points_scored(player_name) > most_points_scored
      most_points_scored = num_points_scored(player_name)
    end
  }
  
  #finds player to most pts and returns their name
  game_hash.each {|outer_key,outer_value|
    outer_value.each {|middle_key,middle_value|
      if middle_key == :players
        middle_value.each {|player_hash_element|
          if player_hash_element[:points] == most_points_scored
            puts player_hash_element[:player_name]
            
          end
        }
      end
    }
  }
end

def winning_team
  home_score = 0
  away_score = 0
  
  game_hash.each {|outer_key,outer_value|
    if outer_key == :home
      outer_value.each {|middle_key,middle_value|
        if middle_key == :players
        middle_value.each {|player_hash_element|
          home_score += player_hash_element[:points]
        }
       end
        
      }
    elsif outer_key == :away
      outer_value.each {|middle_key,middle_value|
        if middle_key == :players
        middle_value.each {|player_hash_element|
          away_score += player_hash_element[:points]
        }
        end
      }
    end
  }
  
end

winning_team