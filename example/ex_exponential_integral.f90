module example_exponential_integral
! Simple tests for exponential integrals Ei and E1.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 30-05-2025 - Rodrigo Castro - Original code

  use wildf_kinds, only: wp
  use exponential_integral, only: ei, e1

  implicit none
  private
  public :: example_ei, example_e1x, example_e1z
 
contains

  subroutine example_ei()
    real(wp) :: ei_t1, ei_t2, ei_root
    ei_root = 0.3725074107813666_wp

    ei_t1 = abs(-0.30266853926582593_wp - ei(0.3_wp)) / abs(-0.30266853926582593_wp)
    ei_t2 = abs(1.058563689713169e+20_wp - ei(50.0_wp)) / abs(1.058563689713169e+20_wp)

    print '(a)', '--------------------------'
    print '(a)', 'Exponential Integral Ei(x)'
    print '(a)', '--------------------------'
    print '(a, es22.15)', 'ei_t1 = ', ei_t1
    print '(a, es22.15)', 'ei_t2 = ', ei_t2
    print '(a, es22.15)', '-ei(1.0) = ', -ei(1.0_wp)
    print '(a, es22.15)', 'ei(-1.5) = ', ei(-1.5_wp)
    print '(a, es22.15)', 'ei(root) = ', ei(ei_root)
    print '(a, sp, g0)', 'ei(0.0) = ', ei(0.0_wp)
  end subroutine example_ei

  subroutine example_e1x()
    real(wp) :: e1x_t1, e1x_t2

    e1x_t1 = abs(0.55977359477616084_wp - e1(0.5_wp)) / abs(0.55977359477616084_wp)
    e1x_t2 = abs(0.10001958240663265_wp - e1(1.5_wp)) / abs(0.10001958240663265_wp)

    print '(a)', '--------------------------'
    print '(a)', 'Exponential Integral E1(x)'
    print '(a)', '--------------------------'
    print '(a, es22.15)', 'e1x_t1 = ', e1x_t1
    print '(a, es22.15)', 'e1x_t2 = ', e1x_t2
    print '(a, es22.15)', '-e1x(1.5) = ', -e1(1.5_wp)
    print '(a, sp, g0)' , 'e1x(0.0) = ', e1(0.0_wp)
  end subroutine example_e1x

  subroutine example_e1z()
    real(wp) :: e1z_t1, e1z_t2, e1z_t3

    e1z_t1 = abs((-0.014529959529202443_wp, -0.015866824826503003_wp) - e1((2.5_wp, 1.8_wp))) / &
             abs((-0.014529959529202443_wp, -0.015866824826503003_wp))
    e1z_t2 = abs((0.75128638206377318_wp, -57.45565336638456_wp) - e1((-6.4_wp, -8.9_wp))) / &
             abs((0.75128638206377318_wp, -57.45565336638456_wp))
    e1z_t3 = abs((-4.2432089533906728e-6_wp, -7.7188970166104144e-6_wp) - e1((9.1_wp, 7.7_wp))) / &
             abs((-4.2432089533906728e-6_wp, -7.7188970166104144e-6_wp))

    print '(a)', '--------------------------'
    print '(a)', 'Exponential Integral E1(z)'
    print '(a)', '--------------------------'
    print '(a, es22.15)', 'e1z_t1 = ', e1z_t1
    print '(a, es22.15)', 'e1z_t2 = ', e1z_t2
    print '(a, es22.15)', 'e1z_t3 = ', e1z_t3
    print '(a, 2(es22.15, 1x))', 'e1z(-1.0) = ', e1((-1.0_wp, 0.0_wp))
    print '(a, sp, g0, f4.1)', 'e1z(0.0) = ', e1((0.0_wp, 0.0_wp))
  end subroutine example_e1z

end module example_exponential_integral
