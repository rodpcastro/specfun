module readwrite
! Read and write test points data.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 30-05-2025 - Rodrigo Castro - Original code

  use wildf_kinds, only: wp

  implicit none
  private
  public :: read_test_points, write_test_points

  interface read_test_points
    module procedure read_real_test_points, read_complex_test_points 
  end interface read_test_points

  interface write_test_points
    module procedure write_real_test_points, write_complex_test_points 
  end interface write_test_points

contains
  
  integer function number_of_lines(filename)
    ! Gets the number of lines in a file.

    character(len=*), intent(in) :: filename
    integer :: fileunit
    open(newunit=fileunit, file=filename)
    number_of_lines = 0
    do
      read(unit=fileunit, fmt=*, end=1)
      number_of_lines = number_of_lines + 1
    end do
    1 continue
    close(unit=fileunit)
  end function number_of_lines

  subroutine read_real_test_points(filename, x, y, npts)
    ! Reads real test points from file.

    character(len=*), intent(in) :: filename
    real(wp), intent(in out), allocatable :: x(:), y(:)
    integer :: fileunit, npts, i

    npts = number_of_lines(filename)
    allocate(x(npts))
    allocate(y(npts))

    open(newunit=fileunit, file=filename)
    do i = 1, npts
      read(fileunit, fmt=*, end=1) x(i), y(i)
    end do
    1 close(fileunit)
  end subroutine read_real_test_points

  subroutine read_complex_test_points(filename, x, y, npts)
    ! Reads complex test points from file.

    character(len=*), intent(in) :: filename
    complex(wp), intent(in out), allocatable :: x(:), y(:)
    real(wp) :: xreal, ximag, yreal, yimag
    integer :: fileunit, npts, i

    npts = number_of_lines(filename)
    allocate(x(npts))
    allocate(y(npts))

    open(newunit=fileunit, file=filename)
    do i = 1, npts
      read(fileunit, fmt=*, end=1) xreal, ximag, yreal, yimag
      x(i) = cmplx(xreal, ximag, kind=wp)
      y(i) = cmplx(yreal, yimag, kind=wp)
    end do
    1 close(fileunit)
  end subroutine read_complex_test_points

  subroutine write_real_test_points(filename, x, y, z, ic)
    ! Write real test points data.

    character(len=*), intent(in) :: filename
    real(wp), intent(in), allocatable :: x(:), y(:), z(:)
    logical, intent(in), allocatable :: ic(:)
    character(len=:), allocatable :: outfmt
    integer :: fileunit, i

    outfmt = '(3(es22.15, 2x), l)'
    open(newunit=fileunit, file=filename)
    do i = 1, size(x)
      write(fileunit, fmt=outfmt) x(i), y(i), z(i), ic(i)
    end do
    close(fileunit)
  end subroutine write_real_test_points

  subroutine write_complex_test_points(filename, x, y, z, ic)
    ! Write complex test points data.

    character(len=*), intent(in) :: filename
    complex(wp), intent(in), allocatable :: x(:), y(:), z(:)
    logical, intent(in), allocatable :: ic(:)
    character(len=:), allocatable :: outfmt
    integer :: fileunit, i

    outfmt = '(6(es22.15, 2x), l)'
    open(newunit=fileunit, file=filename)
    do i = 1, size(x)
      write(fileunit, fmt=outfmt) x(i)%re, x(i)%im, &
                                  y(i)%re, y(i)%im, &
                                  z(i)%re, z(i)%im, &
                                  ic(i)
    end do
    close(fileunit)
  end subroutine write_complex_test_points

end module readwrite
