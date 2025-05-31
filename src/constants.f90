module constants
!* Mathematical constants.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 30-05-2025 - Rodrigo Castro - Original code
!
! References
! ----------
! [1] N. J. A. Sloane. 1964. The Online Encyclopedia of Integer Sequences.
!*    https://oeis.org/.

  use wildf_kinds, only: wp
  use, intrinsic :: ieee_arithmetic, only: ieee_value, &
                                           ieee_positive_inf, &
                                           ieee_negative_inf

  implicit none
  private
  public :: pi, gm, ninf, pinf
  
  real(wp), parameter :: pi = 3.14159265358979323846264338327950288e+0_wp  !! π
  real(wp), parameter :: gm = 5.77215664901532860606512090082402431e-1_wp  !! Euler's constant γ

contains

  pure real(wp) function ninf()
    !! negative infinity (-∞)
    ninf = ieee_value(1.0_wp, ieee_negative_inf)
  end function ninf

  pure real(wp) function pinf()
    !! positive infinity (+∞)
    pinf = ieee_value(1.0_wp, ieee_positive_inf)
  end function pinf

end module constants
