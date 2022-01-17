require_relative '../french_ssn'

describe '#french_ssn_info' do
  it "If ssn is an empty string it should return 'The number is invalid'" do
    actual = french_ssn_info('')
    expect(actual).to eq('The number is invalid')
  end

  it "If ssn is 123 it should return 'The number is invalid'" do
    actual = french_ssn_info('123')
    expect(actual).to eq('The number is invalid')
  end

  it 'If ssn is valid, it should return correct information of that person' do
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expect(actual).to eq('a man, born in December, 1984 in Seine-Maritime.')
  end

  it 'If ssn is valid, it should return correct information of that person' do
    actual = french_ssn_info('2 86 04 72 123 456 39')
    expect(actual).to eq('a woman, born in April, 1986 in Sarthe.')
  end
end
