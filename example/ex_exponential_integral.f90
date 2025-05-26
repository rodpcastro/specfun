program example_exponential_integral
! Simple test exponential integrals Ei and E1.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 26-04-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use exponential_integral, only: ei, e1

  implicit none
  
  character(:), allocatable :: fmt
  real(real64) :: ei_t1, ei_t2, e1x_t1, e1x_t2, &
                  e1z_t1, e1z_t2, e1z_t3, ei_root

  ei_root = 0.3725074107813666d0

  ei_t1 = abs(-0.30266853926582593d0 - ei(0.3d0)) / abs(-0.30266853926582593d0)
  ei_t2 = abs(1.058563689713169d+20 - ei(50.0d0)) / abs(1.058563689713169d+20)
  e1x_t1 = abs(0.55977359477616084d0 - e1(0.5d0)) / abs(0.55977359477616084d0)
  e1x_t2 = abs(0.10001958240663265d0 - e1(1.5d0)) / abs(0.10001958240663265d0)
  e1z_t1 = abs((-0.014529959529202443d0, -0.015866824826503003d0) - e1((2.5d0, 1.8d0))) / &
           abs((-0.014529959529202443d0, -0.015866824826503003d0))
  e1z_t2 = abs((0.75128638206377318d0, -57.45565336638456d0) - e1((-6.4d0, -8.9d0))) / &
           abs((0.75128638206377318d0, -57.45565336638456d0))
  e1z_t3 = abs((-4.2432089533906728d-6, -7.7188970166104144d-6) - e1((9.1d0, 7.7d0))) / &
           abs((-4.2432089533906728d-6, -7.7188970166104144d-6))

  fmt = '(a, es22.15)'
  print '(a)', '---------------------'
  print '(a)', 'Exponential Integrals'
  print '(a)', '---------------------'
  print fmt, 'ei_t1  = ', ei_t1
  print fmt, 'ei_t2  = ', ei_t2
  print fmt, 'e1x_t1 = ', e1x_t1
  print fmt, 'e1x_t2 = ', e1x_t2
  print fmt, 'e1z_t1 = ', e1z_t1
  print fmt, 'e1z_t2 = ', e1z_t2
  print fmt, 'e1z_t3 = ', e1z_t3
  print '(a, sp, g0)', 'ei(0.0)  = ', ei(0.0d0)
  print '(a, sp, g0)', 'e1x(0.0) = ', e1(0.0d0)
  print '(a, sp, g0, f4.1)', 'e1z(0.0) = ', e1((0.0d0, 0.0d0))
  print fmt, '-ei(1.0)  = ', -ei(1.0d0)
  print '(a, 2(es22.15, 1x))', 'e1z(-1.0) = ', e1((-1.0d0, 0.0d0))
  print fmt, 'ei(-1.5)   = ', ei(-1.5d0)
  print fmt, '-e1x(1.5)  = ', -e1(1.5d0)
  print fmt, 'ei(root) = ', ei(ei_root)

end program example_exponential_integral
