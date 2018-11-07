# constants
koofSt = [0,0,12.7,4.3,3.18,2.78,2.57,2.45,2.36,2.31,2.26,2.14,2.09,1.96]
maxLen = 19

# functions
def avrgFind(n, a):
    sum = 0
    for i in a:
        sum = sum + float(i)
    return sum/n

def daListFind(avrg, a):
    for i in a:
        yield round(avrg - float(i), 5)

def daListSqr(list):
    for i in list:
        yield round(i**2, 5)

# procedures
def printI(str, val, mod = ''):
    for i in range(maxLen - len(str)):
        print(' ', end='')
    print(str, ': ', val, mod)

# input
b = float(input('Enter division one: ')) 
n = int(input('Enter n: '))
aList = []

for i in range(n):
    aList.append(float(input('A' + str(i+1) + ': ')))

# init
avrg = avrgFind(n, aList)
daList = list(daListFind(avrg, aList))
daListSqr = list(daListSqr(daList))
avrgMistake = (lambda list, n : (sum(list)/(n*(n-1)))**0.5) (daListSqr, n)
randMistake = koofSt[n] * avrgMistake
devMistake = b / 3
roundMistake = b / 2 * 0.95
fullMistake = (lambda rand, dev, round : (rand**2 + dev**2 + round**2)**0.5) (randMistake, devMistake, roundMistake)

# output
print()
printI('A list', aList)
printI('Avrg:', round(avrg, 5))
printI('Del A list', daList)
printI('Sum of A list els:', round(sum(daList), 5))
printI('Del A list squared:', daListSqr)
printI('Arvg Misteke:', round(avrgMistake, 5))
printI('Student koof:', koofSt[n])
printI('Random mistake:', round(randMistake, 5))
printI('Device mistake:', round(devMistake, 5))
printI('Round mistake:', roundMistake, '\n')
printI('Full mistake:', round(fullMistake, 5))
printI('Relative mistake: ', round(fullMistake/avrg * 100, 3), '%\n')