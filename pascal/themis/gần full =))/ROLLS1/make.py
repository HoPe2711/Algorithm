import os, sys

file = sys.argv[1]
try:
	low = int(sys.argv[2])
except Error as e:
	low = 1
try:
	high = int(sys.argv[3])
except Error as e:
	high = 20

for i in range(low, high + 1):
	print("Case %d" % i)
	# print(" - Input")
	# os.system("python gen.py > %02d.in && cat %02d.in" % (i, i))
	print(" - Output")
	os.system("./%s < %02d.in > %02d.out && cat %02d.out" % (file, i, i, i))

for i in range(low, high + 1):
	print(os.path.join(os.getcwd(), '%02d.in' % i) + '||' + os.path.join(os.getcwd(), '%02d.out' % i))