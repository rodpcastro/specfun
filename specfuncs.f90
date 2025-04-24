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
  use expint, only: ei, e1  

  implicit none
  
  real(real64) :: e1_t1, e1_t2, ei_t1, ei_t2

  e1_t1 = dabs(0.55977359477616084d0 - e1(0.5d0))
  e1_t2 = dabs(0.10001958240663265d0 - e1(1.5d0))
  ei_t1 = dabs(-0.30266853926582593d0 - ei(0.3d0))
  ei_t2 = dabs(1.058563689713169d+20 - ei(50.0d0))

  print *, 'e1_t1 = ', e1_t1
  print *, 'e1_t2 = ', e1_t2
  print *, 'ei_t1 = ', ei_t1
  print *, 'ei_t2 = ', ei_t2

end program specfuncs
