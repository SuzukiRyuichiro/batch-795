# frozen_string_literal: true

require 'date'
require 'yaml'

ORIGINAL_SSN_REGEX = /^(?<gender>[12])\s+(?<year>\d\d)\s+(?<month>[0-1]\d)\s+(?<department>\d{2,3})\s+(?<random>\d{3}\s\d{3})\s+(?<key>\d\d)\s*$/

SSN_REGEX = %r{^(?<gender>[12])\s+        # the string starts with single digit, either 1 or 2. Name them as gender. Followed by one or more spaces.
              (?<year>\d\d)\s+            # then, it should have two digits in sequence. Name them as year. Followed by one or more spaces.
              (?<month>[0-1]\d)\s+        # then, it should have two digits in sequence. First one can only be 0 or 1. Second one can be any number. Name them as month. Followed by one or more spaces.
              (?<department>\d{2,3})\s+   # then, it should have two or three digits in sequence. Name them as department. Followed by one or more spaces.
              (?<random>\d{3}\s\d{3})\s+  # then, it should have three digits, a space, then three digits. Name them as random. Followed by one or more spaces.
              (?<key>\d\d)\s*$            # lastly, it should have two digit. Name them as key. End of string.
            }x.freeze

def french_ssn_info(number)
  # Extract match from SSN
  match_data = number.match(SSN_REGEX)
  # If the number is not valid, return 'The number is...'
  return 'The number is invalid.' if match_data.nil? || !valid?(match_data[:key].to_i, number)

  # extract each part of the number where we can extract information
  # gender = match_data[:gender].to_i == 1 ? 'man' : 'woamn'
  gender = ['man', 'woman'][match_data[:gender].to_i - 1]
  month = Date::MONTHNAMES[match_data[:month].to_i]
  year = "19#{match_data[:year]}"
  department = YAML.load_file('data/french_departments.yml')[match_data[:department]]

  "a #{gender}, born in #{month}, #{year} in #{department}."
end

# check if the two trailing numbers
def valid?(key, ssn)
  # remove space, then select number excluding the last two digits
  ssn_without_key = ssn.gsub(/\s/, '')[0...-2].to_i
  # check if the remainder matches with the last two trailing digits
  key == (97 - ssn_without_key) % 97
end
