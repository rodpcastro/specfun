module expint
! Purpose:
!   Purpose.
!
! Author:
!   Rodrigo Castro (GitHub: rodpcastro)
!
! Creation Date:
!   22-04-2025
!
! Modification History:
!   <dd-mm-yyyy> - <Name> - <Changes>
!
! References:
!   Shanjie Zhang, Jianming Jin (1996). Computation of Special Functions.
!
  use iso_fortran_env, only: real64
  use constants, only: pi, gm

  implicit none
  private
  public :: e1
  
contains

  pure real(real64) function e1(x)
    ! Exponential integral E1(x)
    !
    ! Parameters
    ! ----------
    ! x : real(8)
    !   Real number ≥ 0
    !    
    ! Returns
    ! -------
    ! e1 : real(8) 
    !   Exponential integral of x

    real(real64) :: x
    e1 = x
  end function e1

end module expint
