module internal
! Internal procedures.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 22-05-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real32, real64

  implicit none
  private
  public :: eps32, eps64, isclose

  real(real32), parameter :: eps32 = epsilon(1.0)
  real(real64), parameter :: eps64 = epsilon(1.0d0)

contains

  pure logical function isclose(a, b, rel_tol, abs_tol) 
    ! Evalutes the closeness between two real numbers.
    !
    ! Parameters
    ! ----------
    ! a : real(real64)
    !   Real number.
    ! b : real(real64)
    !   Real number.
    ! rel_tol : real(real64), default=eps32
    !   Relative tolerance.
    ! abs_tol : real(real64), default=eps32
    !   Absolute tolerance.
    !    
    ! Returns
    ! -------
    ! isclose : logical
    !   .true. if a and b are close to each other according to tolerance, and
    !   .false. otherwise.
    !
    ! References
    ! ----------
    ! [1] Christopher Barker. 2015. PEP 485 – A Function for testing approximate equality.
    !     https://peps.python.org/pep-0485/.

    real(real64), intent(in) :: a, b
    real(real64), intent(in), optional :: rel_tol, abs_tol
    real(real64) :: rel_tol_, abs_tol_

    if (present(rel_tol)) then
      rel_tol_ = rel_tol
    else
      rel_tol_ = eps32
    end if

    if (present(abs_tol)) then
      abs_tol_ = abs_tol
    else
      abs_tol_ = eps32
    end if

    isclose = abs(a - b) <= max(rel_tol_ * max(abs(a), abs(b)), abs_tol_)
  end function isclose

end module internal
