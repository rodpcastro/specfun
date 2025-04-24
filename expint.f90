module expint
! Exponential integrals Ei and E1.
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
! Shanjie Zhang, Jianming Jin (1996). Computation of Special Functions.

  use iso_fortran_env, only: int8, real64
  use constants, only: pi, gm

  implicit none
  private
  public :: ei, e1
  
contains

  pure real(real64) function ei(x)
    ! Exponential integral Ei(x)
    !
    ! Parameters
    ! ----------
    ! x : real(8)
    !   Real number ≥ 0
    !    
    ! Returns
    ! -------
    ! ei : real(8) 
    !   Exponential integral of x

    real(real64), intent(in) :: x
    real(real64) :: r
    integer(int8) :: n, m

    if (x == 0.0d0) then
      ei = -1.0d+300
    else if (x <= 40.0d0) then
      ei = x
      r = x
      do n = 2, 100
        r = r * x * (n-1) / n**2
        ei = ei + r
        if (dabs(r) <= 1.0d-15*dabs(ei)) exit
      end do
      ei = ei + gm + dlog(x)
    else
      ei = 1.0d0
      r = 1.0d0
      do n = 1, 20
        r = r * n / x
        ei = ei + r
      end do
      ei = dexp(x) * ei / x 
    end if

  end function ei

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

    real(real64), intent(in) :: x
    real(real64) :: r
    integer(int8) :: n, m

    if (x == 0.0d0) then
      e1 = 1.0d+300
    else if (x <= 1.0d0) then
      e1 = x
      r = x
      do n = 2, 25
        r = r * x * (1-n) / n**2
        e1 = e1 + r
        if (dabs(r) <= 1.0d-15*dabs(e1)) exit
      end do
      e1 = e1 - gm - dlog(x)
    else
      m = 20 + int(80.0/x)
      r = 0.0d0
      do n = m, 1, -1
        r = n / (1.0d0 + n / (x + r))
      end do
      e1 = dexp(-x) / (x + r)
    end if

  end function e1

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

    real(real64), intent(in) :: x
    real(real64) :: r
    integer(int8) :: n, m

    if (x == 0.0d0) then
      e1 = 1.0d+300
    else if (x <= 1.0d0) then
      e1 = x
      r = x
      do n = 2, 25
        r = r * x * (1-n) / n**2
        e1 = e1 + r
        if (dabs(r) <= 1.0d-15*dabs(e1)) exit
      end do
      e1 = e1 - gm - dlog(x)
    else
      m = 20 + int(80.0/x)
      r = 0.0d0
      do n = m, 1, -1
        r = n / (1.0d0 + n / (x + r))
      end do
      e1 = dexp(-x) / (x + r)
    end if

  end function e1

end module expint
