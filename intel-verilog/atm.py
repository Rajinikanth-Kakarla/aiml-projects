"""
menu
    - deposit
    - withdrawl
    - check balance
    - transfer
    - quit
if deposit update database(account)
elif withdrawl update database(account_balance)
    if withdrawl more than 10k then ask for facial recognition
elif check balance print(account_balance)
elif transfer update database(account_balance , dest_account_balance)
elif quit exit()
"""

# Path: atm.py
account = [[1234,1000,10000],
           [2345,1001,15000],
           [3456,1010,20000],
           [4567,1011,25000]]

x = int(input())
b = int(input('account number: '))
if x == 1:
    a = int(input('amount to be added: '))
    c = int(input('enter pin: '))
    index=None
    for i in range(len(account)):
        if account[i][0] == b:
            index = i
            break
    if index is not None:
        if account[index][1] == c:
            account[index][2] += a
            print('amount added')
            print('updated amount', account[index][2])
        else:
            print('Invalid Input')
    else:
        print('Invalid Input')

    pass
elif x == 2:
    c = int(input('enter pin: '))
    a = int(input('amount to be withdrawn: '))
    index = None
    for i in range(len(account)):
        if account[i][0] == b:
            index = i
            break
    if index is not None:
        if account[index][1] == c:
            if a <= 10000:
                account[index][2] -= a
                print('amount withdrawn')
                print('updated amount', account[index][2])
            else:
                print('amount exceeds limit')
        else:
            print('Invalid Input')
    pass
elif x == 3:
    c = int(input('enter pin: '))
    index = None
    for i in range(len(account)):
        if account[i][0] == b:
            index = i
            break
    if index is not None:
        if account[index][1] == c:
            print('account balance', account[index][2])
        else:
            print('Invalid Input')

    pass
elif x == 4:
    c = int(input('enter pin: '))
    d = int(input('enter destination account number: '))
    a = int(input('amount to be transferred: '))
    index = None
    for i in range(len(account)):
        if account[i][0] == b:
            index = i
            break
    if index is not None:
        if account[index][1] == c:
            index2 = None
            for i in range(len(account)):
                if account[i][0] == d:
                    index2 = i
                    break
            if index2 is not None:
                if a < 5000:
                    account[index][2] -= a
                    account[index2][2] += a
                    print('amount transferred')
                    print('updated amount', account[index][2])
                    print('updated amount', account[index2][2])
                else:
                    print('amount exceeds limit')
            else:
                print('Invalid Input')
        else:
            print('Invalid Input')

    pass
elif x == 5:
    # quit
    exit()
    pass
else:
    print("Invalid Input")

