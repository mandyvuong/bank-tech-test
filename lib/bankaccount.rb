class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    fail "Invalid deposit" if amount == 0
    @balance += amount
  end

  def withdrawal(amount)
    @balance -= amount
  end

  def printstatement
    "date || credit || debit || balance"
  end
end