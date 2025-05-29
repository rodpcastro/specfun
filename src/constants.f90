module constants
!* Mathematical constants.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 23-04-2025 - Rodrigo Castro - Original code
!
! References
! ----------
! [1] N. J. A. Sloane. 1964. The Online Encyclopedia of Integer Sequences.
!*    https://oeis.org/.

  use, intrinsic :: iso_fortran_env, only: real64

  implicit none
  private
  public :: pi, gm
  
  real(real64), parameter :: pi = 3.141592653589793d0   !! π
  real(real64), parameter :: gm = 0.5772156649015329d0  !! Euler's constant γ

end module constants
