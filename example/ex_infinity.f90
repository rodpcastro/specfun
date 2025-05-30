module example_infinity
! Working with infinity in Fortran.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 29-05-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_positive_inf, ieee_negative_inf

  implicit none
  private
  public :: example_inf
  
contains

  subroutine example_inf()
    real(real64) :: h1 = 2*huge(1.0_real64)
    real(real64) :: h2 = -2*huge(1.0_real64)

    print '(a)', '------------'
    print '(a)', '+- Infinity'
    print '(a)', '------------'
    print '(a, sp, g0)', 'ieee: ', ieee_value(1.0d0, ieee_positive_inf)
    print '(a, sp, g0)', 'ieee: ', ieee_value(1.0d0, ieee_negative_inf)
    print '(a, sp, g0)', 'huge: ', h1
    print '(a, sp, g0)', 'huge: ', h2
  end subroutine example_inf

end module example_infinity
