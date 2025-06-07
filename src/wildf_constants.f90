!  ┓ ┏•┓ ┓┏┓  Licensed under the MIT License
!  ┃┃┃┓┃┏┫┣   Copyright (c) 2025 Rodrigo Castro
!  ┗┻┛┗┗┗┻┻   https://github.com/rodpcastro/wildf 

module wildf_constants
!* # Constants
! Mathematical constants.
!
! Constants:
!
! - `pi`: \(\pi\)
! - `gm`: Euler's constant \(\gamma\) 
!
! Procedures:
!
! - `ninf`: Negative infinity \(-\infty\)
! - `pinf`: Positive infinity \(+\infty\)
!
! ## References
! 1. N. J. A. Sloane. 1964. The Online Encyclopedia
!*   of Integer Sequences. <https://oeis.org/>

  use wildf_kinds, only: wp
  use, intrinsic :: ieee_arithmetic, only: ieee_value, &
                                           ieee_positive_inf, &
                                           ieee_negative_inf

  implicit none
  private
  public :: pi, gm, ninf, pinf
  
  !> \(\pi\)
  real(wp), parameter :: pi = 3.14159265358979323846264338327950288e+0_wp
  !> Euler's constant \(\gamma\)
  real(wp), parameter :: gm = 5.77215664901532860606512090082402431e-1_wp

contains

  pure real(wp) function ninf()
    !! Negative infinity \(-\infty\)
    ninf = ieee_value(1.0_wp, ieee_negative_inf)
  end function ninf

  pure real(wp) function pinf()
    !! Positive infinity \(+\infty\)
    pinf = ieee_value(1.0_wp, ieee_positive_inf)
  end function pinf

end module wildf_constants
