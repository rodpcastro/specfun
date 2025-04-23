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
  use expint, only: e1  

  implicit none
  
  real(real64) :: x

  x = 1.5d0

  print *, 'E1(', x, ') = ', e1(x)

end program specfuncs
