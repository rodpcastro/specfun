!  ┓ ┏•┓ ┓┏┓  Licensed under the MIT License
!  ┃┃┃┓┃┏┫┣   Copyright (c) 2025 Rodrigo Castro
!  ┗┻┛┗┗┗┻┻   https://github.com/rodpcastro/wildf 

module wildf_exponential_integral
!* # Exponential integral
! Exponential integrals.
!
! Procedures:
!
! - `ei`: Exponential integral \(\mathrm{Ei}(x)\)
! - `e1`: Exponential integral \(\mathrm{E}_1(x)\) or \(\mathrm{E}_1(z)\)
!
! ## References
! 1. Shanjie Zhang, Jianming Jin. 1996. Computation 
!    of Special Functions. Wiley, New York, NY.
!*   <https://search.worldcat.org/title/33971114>

  use wildf_kinds, only: i2, wp
  use wildf_constants, only: pi, gm, ninf, pinf
  use wildf_numerror, only: ismall

  implicit none
  private
  public :: ei, e1
  
  interface e1
    !! Exponential integral \(\mathrm{E}_1(x)\) or \(\mathrm{E}_1(z)\).
    module procedure e1x, e1z
  end interface e1

contains

  pure real(wp) function ei(x)
    !! Exponential integral \(\mathrm{Ei}(x)\).
    !
    !! \(\lbrace x \in \mathbb{R} \mid x \neq 0 \rbrace\)

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
    else if (x <= 709.0_wp) then
      ei = 1.0_wp
      r = 1.0_wp
      do n = 1, 20
        r = r * n / x
        ei = ei + r
      end do
      ei = exp(x) * ei / x 
    else
      ei = pinf()
    end if
  end function ei

  pure real(wp) function e1x(x)
    !! Exponential integral \(\mathrm{E}_1(x)\).
    !
    !! \(\lbrace x \in \mathbb{R} \mid x \neq 0 \rbrace\)

    real(wp), intent(in) :: x

    complex(wp) :: z, eoz
    real(wp) :: r
    integer(i2) :: n, m

    if (x == 0.0_wp) then
      e1x = pinf()
    else if (x < 0.0_wp) then
      z = cmplx(x, 0.0_wp, kind=wp)
      eoz = e1z(z)
      e1x = eoz%re
    else if (x <= 1.0_wp) then
      e1x = x
      r = x
      do n = 2, 26
        r = r * x * (1-n) / n**2
        e1x = e1x + r
        if (ismall(r, e1x)) exit
      end do
      e1x = e1x - gm - log(x)
    else if (x <= 738.0_wp) then
      m = int(20.0_wp + 80.0_wp/x, i2)
      r = 0.0_wp
      do n = m, 1, -1
        r = n / (1.0_wp + n / (x + r))
      end do
      e1x = exp(-x) / (x + r)
    else
      e1x = 0.0_wp
    end if
  end function e1x

  pure complex(wp) function e1z(z)
    !! Exponential integral \(\mathrm{E}_1(z)\).
    !
    !! \(z \in \mathbb{C} \setminus \left( \lbrace z \in \mathbb{C} \mid \Re(z) \lt 0,
    !! \thinspace 0 \lt |\Im(z)| \lt 10^{-6} \rbrace \cup \lbrace 0 \rbrace \right)\)

    complex(wp), intent(in) :: z

    real(wp) :: zabs
    complex(wp) :: r
    integer(i2) :: n

    zabs = abs(z)

    if (zabs == 0.0_wp) then
      e1z = cmplx(pinf(), -pi, kind=wp)
      return
    else if (zabs <= 10.0_wp .or. z%re < 0.0_wp .and. zabs < 20.0_wp) then
      e1z = z
      r = z
      do n = 2, 151
        r = r * z * (1-n) / n**2
        e1z = e1z + r
        if (ismall(abs(r), abs(e1z))) exit
      end do
      e1z = e1z - gm - log(z)
    else if (z%re > 738.0_wp .or. (z%re >= 0 .and. abs(z%im) > huge(0.0_wp))) then
      e1z = (0.0_wp, 0.0_wp)
      return
    else if (z%re < -709.0_wp .and. z%im == 0.0_wp) then
      e1z = cmplx(ninf(), -pi, kind=wp) 
      return
    else
      r = (0.0_wp, 0.0_wp)
      do n = 120, 1, -1
        r = n / (1.0_wp + n / (z + r))
      end do
      e1z = exp(-z) / (z + r)
    end if

    if (z%re < 0.0_wp .and. z%im == 0.0_wp) then
      e1z = cmplx(e1z%re, -pi, kind=wp)
    end if
  end function e1z

end module wildf_exponential_integral
