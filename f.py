# x = [-2, 0, 1, 1.5, 2.5]
# f = [-6, -3.75, 1, 0, 3]

print("x = ")
string1 = input().replace("[", "").replace("]", "").replace(", ", " ").split(" ")

print("f = ")
string2 = input().replace("[", "").replace("]", "").replace(", ", " ").split(" ")

n = len(string1)
f = [[0. for i in range(n)] for j in range(n)]
x = [0. for k in range(n)]

if len(string1) != len(string2):
    print("Error")

for i in range(n):
    x[i] = float(string1[i])

for i in range(1):
    for j in range(n):
        f[j][i] = float(string2[j])

for i in range(1, n):
    for j in range(n - i):
        f[j][i] = ((f[j][i - 1] - f[j + 1][i - 1]) / (x[j] - x[i + j]))

for i in range(1):
    for j in range(n - i):
        print(round(f[i][j], 4))
