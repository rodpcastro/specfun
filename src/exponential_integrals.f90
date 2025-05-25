module exponential_integrals
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
! [1] Shanjie Zhang, Jianming Jin. 1996. Computation of Special Functions.
!     Wiley, New York, NY.

  use, intrinsic :: iso_fortran_env, only: int16, real64
  use, intrinsic :: ieee_arithmetic, only: ieee_value, &
                                           ieee_positive_inf, &
                                           ieee_negative_inf
  use constants, only: pi, gm

  implicit none
  private
  public :: ei, e1
  
  interface e1
    module procedure e1x, e1z
  end interface e1

contains

  pure real(real64) function ei(x)
    ! Exponential integral Ei(x).
    !
    ! Parameters
    ! ----------
    ! x : real(real64)
    !   Real number ≥ 0.
    !    
    ! Returns
    ! -------
    ! ei : real(real64) 
    !   Exponential integral of x.

    real(real64), intent(in) :: x
    real(real64) :: r
    integer(int16) :: n

    if (x == 0.0d0) then
      ei = ieee_value(1.0_real64, ieee_negative_inf)
    else if (x <= 40.0d0) then
      ei = x
      r = x
      do n = 2, 101
        r = r * x * (n-1) / n**2
        ei = ei + r
        if (abs(r) <= 1.0d-15*abs(ei)) exit
      end do
      ei = ei + gm + log(x)
    else
      ei = 1.0d0
      r = 1.0d0
      do n = 1, 20
        r = r * n / x
        ei = ei + r
      end do
      ei = exp(x) * ei / x 
    end if

  end function ei

  pure real(real64) function e1x(x)
    ! Exponential integral E1(x).
    !
    ! Parameters
    ! ----------
    ! x : real(real64)
    !   Real number ≥ 0.
    !    
    ! Returns
    ! -------
    ! e1x : real(real64) 
    !   Exponential integral of x.

    real(real64), intent(in) :: x
    real(real64) :: r
    integer(int16) :: n, m

    if (x == 0.0d0) then
      e1x = ieee_value(1.0_real64, ieee_positive_inf)
    else if (x <= 1.0d0) then
      e1x = x
      r = x
      do n = 2, 26
        r = r * x * (1-n) / n**2
        e1x = e1x + r
        if (abs(r) <= 1.0d-15*abs(e1x)) exit
      end do
      e1x = e1x - gm - log(x)
    else
      m = int(20.0 + 80.0/x, int16)
      r = 0.0d0
      do n = m, 1, -1
        r = n / (1.0d0 + n / (x + r))
      end do
      e1x = exp(-x) / (x + r)
    end if

  end function e1x

  pure complex(real64) function e1z(z)
    ! Exponential integral E1(z).
    !
    ! Parameters
    ! ----------
    ! z : complex(real64)
    !   Complex number.
    !    
    ! Returns
    ! -------
    ! e1z : complex(real64) 
    !   Exponential integral of z.

    complex(real64), intent(in) :: z
    real(real64) :: x, a
    complex(real64) :: r
    integer(int16) :: n

    x = real(z)
    a = abs(z)

    if (a == 0.0d0) then
      e1z = cmplx(ieee_value(1.0_real64, ieee_positive_inf), 0.0_real64)
    else if (a <= 10.0d0 .or. x < 0.0d0 .and. a < 20.0d0) then
      e1z = z
      r = z
      do n = 2, 151
        r = r * z * (1-n) / n**2
        e1z = e1z + r
        if (abs(r) <= 1.0d-15*abs(e1z)) exit
      end do
      e1z = e1z - gm - log(z)
    else
      r = (0.0d0, 0.0d0)
      do n = 120, 1, -1
        r = n / (1.0d0 + n / (z + r))
      end do
      e1z = exp(-z) / (z + r)
      if (x <= 0.0d0 .and. imag(z) == 0.0d0) e1z = e1z - pi*(0.0d0, 1.0d0)
    end if

  end function e1z

end module exponential_integrals
