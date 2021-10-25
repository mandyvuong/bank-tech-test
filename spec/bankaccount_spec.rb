require 'bankaccount'

describe BankAccount do
  describe '.printstatement' do
    it 'prints the header of statement' do
      expect(subject.printstatement).to eq "date || credit || debit || balance"
    end
  end

  describe '.balance' do
    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '.deposit' do
    it 'can make a deposit' do
      subject.deposit(10)
      expect(subject.balance).to eq(10)
    end
  end
end