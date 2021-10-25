# Bank tech test

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

| date       | credit  | debit  | balance |
| ---------- | ------- | ------ | ------- |
| 14/01/2023 |         | 500.00 | 2500.00 |
| 13/01/2023 | 2000.00 |        | 3000.00 |
| 10/01/2023 | 1000.00 |        | 1000.00 |

## Plan

Class Bank_Account:

- Variable History
- Method Deposit(int)
- Method Withdrawal(int)
- Method Print_Statement() from latest to old transactions

Alternative option:
Class Account:

Class Transaction:

- Method Deposit(int)
- Method Withdrawal(int)

  Class Statement

- Method Print(string)

Data storage option:

Arrays:
[[date, credit, debit, balance],[date, credit, debit, balance]]

Hashes:
{
date => [],
credit => [],
debit => [],
balance => []
}

Array of hashes
[{date, credit, debit, balance}, {date, credit, debit, balance}]

| input                      | output      | description                                                     |
| -------------------------- | ----------- | --------------------------------------------------------------- |
| deposit(10)                | balance 10  | makes deposit - DONE                                            |
| deposit(100), withdraw(10) | balance 90  | makes deposit - DONE                                            |
| deposit(0)                 | raise error | cannot deposit zero amount - DONE                               |
| withdrawal(0)              | raise error | cannot withdraw zero amount - DONE                              |
| deposit('string')          | raise error | cannot have a string argument in deposit - DONE                 |
| withdrawal('string')       | raise error | cannot have a string argument in withdrawal                     |
| deposit(0.001)             | raise error | cannot have a float argument with more than 2 d.p in deposit    |
| withdrawal(0.001)          | raise error | cannot have a float argument with more than 2 d.p in withdrawal |

Input:
Output: "date || credit || debit || balance"

Input: Deposit(1000)
Output: "date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00"

Input: Deposit(1000), Deposit(2000)
Output: date || credit || debit || balance\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00

Input: Deposit(1000), Deposit(2000), Withdrawal(500)
Output: date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00

Time.now.strftime("%m/%d/%Y") - date format
arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6] - unshift will add a new item to the beginning of an array.

ACT TDD on time
