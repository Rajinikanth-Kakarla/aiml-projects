import csv
import pandas as pd
from csv import writer



data = csv.reader("data.csv")

class Anibot:
    def __init__(self):
        print('|----------------------------------------------------------|')
        print('|                           AniBot.v_1                     |')
        print('|----------------------------------------------------------|')

        def to_infinity():
            index = 0
            while True:
                yield index
                index += 1

        for i in to_infinity():

            x = input("You :")

            if x.isalpha() or x.isdigit() or x.isalnum() or x.istitle() or x.islower() or x.isupper():
                while True:
                    dict = pd.read_csv('data.csv', header=None, index_col=0, squeeze=True).to_dict()
                    if x in dict:
                        a = dict.get(x)
                        print(a)
                        break
                    elif x not in dict:
                        List = []
                        List.append(x)
                        print("iBot: What does " + x + " mean.? help me to learn!")
                        a = input('You:')
                        List.append(a)
                        with open('data.csv', 'a') as z:
                            y = writer(z)
                            y.writerow(List)
                            z.close()
                        break






Anibot()