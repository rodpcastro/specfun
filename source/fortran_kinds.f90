module fortran_kinds
! Alternative to iso_fortran_env kinds.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 21-05-2025 - Rodrigo Castro - Original code

  implicit none
  private
  public :: int16, real64

  integer(kind=2), parameter :: int16 = 2
  integer(kind=2), parameter :: real64 = 8

end module fortran_kinds
