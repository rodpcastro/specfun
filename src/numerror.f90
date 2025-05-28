module numerror
!* Numerical error handling.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 22-05-2025 - Rodrigo Castro - Original code
!
! References
! ----------
! [1] Christopher Barker. 2015. PEP 485 – A Function for testing approximate equality.
!*    https://peps.python.org/pep-0485/.

  use, intrinsic :: iso_fortran_env, only: real32, real64

  implicit none
  private
  public :: eps32, eps64, isclose, ismall

  real(real32), parameter :: eps32 = epsilon(1.0_real32)    !! single precision machine epsilon
  real(real64), parameter :: eps64 = epsilon(1.0_real64)  !! double precision machine epsilon

  ! eps32 = 1.19209290E-07
  ! eps64 = 2.2204460492503131E-016

  interface isclose
    !! Evaluates the closeness between two real or complex numbers.
    module procedure isclose_real, isclose_complex
  end interface isclose

contains

  pure logical function ismall(x, ref, tol)
    !! Evaluates the smallness of x compared to a reference value.
    !
    ! Parameters
    ! ----------
    ! x : real(real64)
    !   Real number.
    ! ref : real(real64), default=1.0_real64
    !   Reference real number.
    ! tol : real(real64), default=eps64
    !   Relative tolerance.
    !    
    ! Returns
    ! -------
    ! ismall: logical
    !   .true. if x is small compared to ref according to a tolerance, and
    !   .false. otherwise.

    real(real64), intent(in) :: x
    real(real64), intent(in), optional :: ref  !! reference value, default=1.0_real64
    real(real64), intent(in), optional :: tol  !! tolerance, default=eps64
    real(real64) :: ref_, tol_

    if (present(ref)) then
      ref_ = ref
    else
      ref_ = 1.0_real64
    end if

    if (present(tol)) then
      tol_ = tol
    else
      tol_ = eps64
    end if

    ismall = abs(x) <= tol_ * abs(ref_)
  end function ismall

  pure logical function isclose_real(a, b, rel_tol, abs_tol) 
    !! Evaluates the closeness between two real numbers.
    ! 
    ! Inspired by reference [1].
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
    !   .true. if a and b are close to each other according to a tolerance, and
    !   .false. otherwise.

    real(real64), intent(in) :: a, b
    real(real64), intent(in), optional :: rel_tol  !! relative tolerance, default=eps32
    real(real64), intent(in), optional :: abs_tol  !! absolute tolerace, default=eps32
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

    isclose_real = abs(a - b) <= max(rel_tol_ * max(abs(a), abs(b)), abs_tol_)
  end function isclose_real

  pure logical function isclose_complex(a, b, rel_tol, abs_tol) 
    !! Evaluates the closeness between two complex numbers.
    ! 
    ! Inspired by reference [1].
    !
    ! Parameters
    ! ----------
    ! a : complex(real64)
    !   Complex number.
    ! b : complex(real64)
    !   Complex number.
    ! rel_tol : real(real64), default=eps32
    !   Relative tolerance.
    ! abs_tol : real(real64), default=eps32
    !   Absolute tolerance.
    !    
    ! Returns
    ! -------
    ! isclose : logical
    !   .true. if a and b are close to each other according to a tolerance, and
    !   .false. otherwise.

    complex(real64), intent(in) :: a, b
    real(real64), intent(in), optional :: rel_tol  !! relative tolerance, default=eps32
    real(real64), intent(in), optional :: abs_tol  !! absolute tolerance, default=eps32
    real(real64) :: are, aim, bre, bim
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

    are = a%re
    aim = a%im
    bre = b%re
    bim = b%im

    isclose_complex = isclose_real(are, bre, rel_tol_, abs_tol_) .and. &
                      isclose_real(aim, bim, rel_tol_, abs_tol_)
  end function isclose_complex

end module numerror
