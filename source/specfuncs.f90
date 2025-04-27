program specfuncs
! Simple test of special functions.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 23-04-2025 - Rodrigo Castro - Original code

  use iso_fortran_env, only: real64
  use expint, only: ei, e1, e1x, e1z

  implicit none
  
  real(real64) :: ei_t1, ei_t2, e1x_t1, e1x_t2, &
                  e1z_t1, e1z_t2, e1z_t3, e1_t1, e1_t2

  ei_t1 = abs(-0.30266853926582593d0 - ei(0.3d0)) / abs(-0.30266853926582593d0)
  ei_t2 = abs(1.058563689713169d+20 - ei(50.0d0)) / abs(1.058563689713169d+20)
  e1x_t1 = abs(0.55977359477616084d0 - e1x(0.5d0)) / abs(0.55977359477616084d0)
  e1x_t2 = abs(0.10001958240663265d0 - e1x(1.5d0)) / abs(0.10001958240663265d0)
  e1z_t1 = abs((-0.014529959529202443d0, -0.015866824826503003d0) - e1z((2.5d0, 1.8d0))) / &
           abs((-0.014529959529202443d0, -0.015866824826503003d0))
  e1z_t2 = abs((0.75128638206377318d0, -57.45565336638456d0) - e1z((-6.4d0, -8.9d0))) / &
           abs((0.75128638206377318d0, -57.45565336638456d0))
  e1z_t3 = abs((-4.2432089533906728d-6, -7.7188970166104144d-6) - e1z((9.1d0, 7.7d0))) / &
           abs((-4.2432089533906728d-6, -7.7188970166104144d-6))
  e1_t1 = abs(e1(0.958d0) - e1x(0.958d0))
  e1_t2 = abs(e1((2.789d0, 5.010d0)) - e1z((2.789d0, 5.010d0)))

  print *, 'ei_t1 = ', ei_t1
  print *, 'ei_t2 = ', ei_t2
  print *, 'e1x_t1 = ', e1x_t1
  print *, 'e1x_t2 = ', e1x_t2
  print *, 'e1z_t1 = ', e1z_t1
  print *, 'e1z_t2 = ', e1z_t2
  print *, 'e1z_t3 = ', e1z_t3
  print *, 'e1_t1 - ', e1_t1
  print *, 'e1_t2 - ', e1_t2

end program specfuncs
