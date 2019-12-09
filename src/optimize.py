from expressions5 import Query
import sys, getopt, time

qtxt = """
dataset A where ((a > 2 or b < 1) and !(c > 2 or x < 3) or z != 3)
"""
qtxt = """
dataset A where !(a > 2 or b < 1 or z != 3)
"""
qtxt = """
dataset A where x=2
"""

q = Query(qtxt)
print ("Parsed:\n", q.parse().pretty())
q.skip_assembly()
print ("Optimized:\n", q.optimize().pretty())