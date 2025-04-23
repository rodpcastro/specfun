module constants
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

  implicit none
  private
  public :: pi, gm
  
  real(real64), parameter :: pi = 3.141592653589793d0
  real(real64), parameter :: gm = 0.5772156649015329d0 ! Euler's constant

end module constants
