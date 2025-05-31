module exponential_integral
!* Exponential integrals Ei and E1.
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
! [1] Shanjie Zhang, Jianming Jin. 1996. Computation of Special Functions.
!*    Wiley, New York, NY.

  use wildf_kinds, only: i2, wp
  use constants, only: pi, gm, ninf, pinf
  use numerror, only: ismall

  implicit none
  private
  public :: ei, e1
  
  interface e1
    !! Exponential integral E1.
    module procedure e1x, e1z
  end interface e1

contains

  pure real(wp) function ei(x)
    !! Exponential integral Ei(x).

    real(wp), intent(in) :: x

    real(wp) :: r
    integer(i2) :: n

    if (x == 0.0_wp) then
      ei = ninf()
    else if (x < 0.0_wp) then
      ei = -e1x(-x)
    else if (x <= 40.0_wp) then
      ei = x
      r = x
      do n = 2, 101
        r = r * x * (n-1) / n**2
        ei = ei + r
        if (ismall(r, ei)) exit
      end do
      ei = ei + gm + log(x)
    else
      ei = 1.0_wp
      r = 1.0_wp
      do n = 1, 20
        r = r * n / x
        ei = ei + r
      end do
      ei = exp(x) * ei / x 
    end if

  end function ei

  pure real(wp) function e1x(x)
    !! Exponential integral E1(x).

    real(wp), intent(in) :: x  !! x ≥ 0

    real(wp) :: r
    integer(i2) :: n, m

    if (x == 0.0_wp) then
      e1x = pinf()
    else if (x <= 1.0_wp) then
      e1x = x
      r = x
      do n = 2, 26
        r = r * x * (1-n) / n**2
        e1x = e1x + r
        if (ismall(r, e1x)) exit
      end do
      e1x = e1x - gm - log(x)
    else
      m = int(20.0_wp + 80.0_wp/x, i2)
      r = 0.0_wp
      do n = m, 1, -1
        r = n / (1.0_wp + n / (x + r))
      end do
      e1x = exp(-x) / (x + r)
    end if

  end function e1x

  pure complex(wp) function e1z(z)
    !! Exponential integral E1(z).

    complex(wp), intent(in) :: z

    real(wp) :: zabs
    complex(wp) :: r
    integer(i2) :: n

    zabs = abs(z)

    if (zabs == 0.0_wp) then
      e1z = cmplx(pinf(), 0.0_wp)
    else if (zabs <= 10.0_wp .or. z%re < 0.0_wp .and. zabs < 20.0_wp) then
      e1z = z
      r = z
      do n = 2, 151
        r = r * z * (1-n) / n**2
        e1z = e1z + r
        if (ismall(abs(r), abs(e1z))) exit
      end do
      e1z = e1z - gm - log(z)
    else
      r = (0.0_wp, 0.0_wp)
      do n = 120, 1, -1
        r = n / (1.0_wp + n / (z + r))
      end do
      e1z = exp(-z) / (z + r)
      if (z%re <= 0.0_wp .and. z%im == 0.0_wp) then
        e1z = e1z + cmplx(0.0_wp, -pi)
      end if
    end if

  end function e1z

end module exponential_integral
