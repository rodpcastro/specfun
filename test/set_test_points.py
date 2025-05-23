import numpy as np
import mpmath

mpmath.mp.dps = 16

def set_test_points_exponential_integral_ei():
    xv = np.logspace(-10, 2, 1000, dtype=np.float64)
    yv = np.array([mpmath.ei(x) for x in xv])
    zv = np.column_stack((xv, yv))
    np.savetxt('test_points/exponential_integral_ei.csv', zv, fmt='%.15e')

if __name__ == '__main__':
    set_test_points_exponential_integral_ei()

