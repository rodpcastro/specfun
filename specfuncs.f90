program specfuncs
!
! Purpose:
!   Purpose.
!
! Author:
!   Rodrigo Castro (GitHub: rodpcastro)
!
! Creation Date:
!   23-04-2025
!
! Modification History:
!   <dd-mm-yyyy> - <Name> - <Changes>
!
! References:
!   Shanjie Zhang, Jianming Jin (1996). Computation of Special Functions.
!

  use iso_fortran_env, only: real64
  use expint, only: e1  

  implicit none
  
  real(real64) :: x

  x = 1.5d0

  print *, 'E1(', x, ') = ', e1(x)

end program specfuncs
