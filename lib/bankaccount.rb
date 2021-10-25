class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def printstatement
    "date || credit || debit || balance"
  end
end