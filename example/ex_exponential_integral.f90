module example_exponential_integral
! Simple tests for exponential integrals Ei and E1.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 29-05-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use exponential_integral, only: ei, e1

  implicit none
  private
  public :: example_ei, example_e1x, example_e1z
 
contains

  subroutine example_ei()
    real(real64) :: ei_t1, ei_t2, ei_root
    ei_root = 0.3725074107813666d0

    ei_t1 = abs(-0.30266853926582593d0 - ei(0.3d0)) / abs(-0.30266853926582593d0)
    ei_t2 = abs(1.058563689713169d+20 - ei(50.0d0)) / abs(1.058563689713169d+20)

    print '(a)', '--------------------------'
    print '(a)', 'Exponential Integral Ei(x)'
    print '(a)', '--------------------------'
    print '(a, es22.15)', 'ei_t1 = ', ei_t1
    print '(a, es22.15)', 'ei_t2 = ', ei_t2
    print '(a, es22.15)', '-ei(1.0) = ', -ei(1.0d0)
    print '(a, es22.15)', 'ei(-1.5) = ', ei(-1.5d0)
    print '(a, es22.15)', 'ei(root) = ', ei(ei_root)
    print '(a, sp, g0)', 'ei(0.0) = ', ei(0.0d0)
  end subroutine example_ei

  subroutine example_e1x()
    real(real64) :: e1x_t1, e1x_t2

    e1x_t1 = abs(0.55977359477616084d0 - e1(0.5d0)) / abs(0.55977359477616084d0)
    e1x_t2 = abs(0.10001958240663265d0 - e1(1.5d0)) / abs(0.10001958240663265d0)

    print '(a)', '--------------------------'
    print '(a)', 'Exponential Integral E1(x)'
    print '(a)', '--------------------------'
    print '(a, es22.15)', 'e1x_t1 = ', e1x_t1
    print '(a, es22.15)', 'e1x_t2 = ', e1x_t2
    print '(a, es22.15)', '-e1x(1.5) = ', -e1(1.5d0)
    print '(a, sp, g0)' , 'e1x(0.0) = ', e1(0.0d0)
  end subroutine example_e1x

  subroutine example_e1z()
    real(real64) :: e1z_t1, e1z_t2, e1z_t3

    e1z_t1 = abs((-0.014529959529202443d0, -0.015866824826503003d0) - e1((2.5d0, 1.8d0))) / &
             abs((-0.014529959529202443d0, -0.015866824826503003d0))
    e1z_t2 = abs((0.75128638206377318d0, -57.45565336638456d0) - e1((-6.4d0, -8.9d0))) / &
             abs((0.75128638206377318d0, -57.45565336638456d0))
    e1z_t3 = abs((-4.2432089533906728d-6, -7.7188970166104144d-6) - e1((9.1d0, 7.7d0))) / &
             abs((-4.2432089533906728d-6, -7.7188970166104144d-6))

    print '(a)', '--------------------------'
    print '(a)', 'Exponential Integral E1(z)'
    print '(a)', '--------------------------'
    print '(a, es22.15)', 'e1z_t1 = ', e1z_t1
    print '(a, es22.15)', 'e1z_t2 = ', e1z_t2
    print '(a, es22.15)', 'e1z_t3 = ', e1z_t3
    print '(a, 2(es22.15, 1x))', 'e1z(-1.0) = ', e1((-1.0d0, 0.0d0))
    print '(a, sp, g0, f4.1)', 'e1z(0.0) = ', e1((0.0d0, 0.0d0))
  end subroutine example_e1z

end module example_exponential_integral
