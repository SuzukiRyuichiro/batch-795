require 'date'
require 'yaml'


SSN_REGEX = /^(?<gender>[12])\s+(?<year>\d\d)\s+(?<month>[0-1]\d)\s+(?<department>\d{2,3})\s+(?<random>\d{3}\s\d{3})\s+(?<key>\d\d)\s*$/

def french_ssn_info(number)
  match_data = number.match(SSN_REGEX)
  return 'The number is invalid' if match_data.nil?
  # extract each part of the number where we can extract information
  gender = ['man', 'woman'][match_data[:gender].to_i - 1]
  # gender = match_data[:gender] == 1 ? 'man' : 'woamn'
  month = Date::MONTHNAMES[match_data[:month].to_i]
  year = "19#{match_data[:year]}"
  department = YAML.load_file('data/french_departments.yml')[match_data[:department]]

  "a #{gender}, born in #{month}, #{year} in #{department}."
end
