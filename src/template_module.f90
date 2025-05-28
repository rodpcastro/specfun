module template_module
!* Module template. The space after * is important for Ford dokmark_alt.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! dd-mm-yyyy - Rodrigo Castro - Original code
!
! References
! ----------
! [1] Author. Year. Title.
!*    URL

  use, intrinsic :: iso_fortran_env, only: int64, real64

  implicit none
  private
  public :: phi, fibonacci

  real(real64), parameter :: phi = 1.618033988749894d0  !! Golden ratio φ

contains

  pure function fibonacci(n) result(fib)
    !! n first terms of the Fibonacci sequence.

    integer(int64), intent(in) :: n  !! number of terms
    integer(int64) :: fib(n)
    integer(int64) :: i

    do i = 1, n
      if (i == 1) then
        fib(i) = 0
      elseif (i == 2) then
        fib(i) = 1
      else
        fib(i) = fib(i-1) + fib(i-2)
      end if
    end do
  end function fibonacci

end module template_module
