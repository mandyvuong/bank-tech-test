require 'bankaccount'

describe BankAccount do
  describe '.printstatement' do
    it 'prints the header of statement' do
      expect(subject.prinstatement).to eq "date || credit || debit || balance"
    end
  end
end