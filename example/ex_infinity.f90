program example_infinity
! Working with infinity in Fortran.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 26-04-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_positive_inf, ieee_negative_inf

  implicit none
  
  character(:), allocatable :: fmt
  real(real64) :: h1 = 2*huge(1.0_real64)
  real(real64) :: h2 = -2*huge(1.0_real64)

  fmt = '(a, sp, g0)' 
  print '(a)', '------------'
  print '(a)', '+- Infinity'
  print '(a)', '------------'
  print fmt, 'ieee: ', ieee_value(1.0d0, ieee_positive_inf)
  print fmt, 'ieee: ', ieee_value(1.0d0, ieee_negative_inf)
  print fmt, 'huge: ', h1
  print fmt, 'huge: ', h2

end program example_infinity
