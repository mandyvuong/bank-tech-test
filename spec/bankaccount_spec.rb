require 'bankaccount'

describe BankAccount do
  describe '.printstatement' do
    it 'prints the header of statement' do
      expect{subject.printstatement}.to output(("date || credit || debit || balance\n")).to_stdout
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
    it 'raises an error with zero deposit' do
      expect{subject.deposit(0)}.to raise_error "Invalid deposit"
    end
    it 'raises an error with string deposit' do
      expect{subject.deposit('this is a string')}.to raise_error "Invalid deposit"
    end
  end

  describe '.withdrawal' do
    it 'can make a deposit, followed by withdrawal' do
      subject.deposit(100)
      subject.withdrawal(10)
      expect(subject.balance).to eq(90)
    end
    it 'raises an error with zero withdrawal' do
      expect{subject.withdrawal(0)}.to raise_error "Invalid withdrawal"
    end
    it 'raises an error with string withdrawal' do
      expect{subject.withdrawal('this is a string')}.to raise_error "Invalid withdrawal"
    end
  end
end