module mod_io

  use, intrinsic :: iso_fortran_env, only: real64
  use mod_alloc, only: alloc

  implicit none
  private
  public :: read_test_points, write_test_points

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

  subroutine read_test_points(filename, x, y)
    ! Reads test points from file.

    character(len=*), intent(in) :: filename
    real(real64), intent(in out), allocatable :: x(:), y(:)
    integer :: fileunit, nlines, i

    nlines = number_of_lines(filename)
    call alloc(x, nlines)
    call alloc(y, nlines)

    open(newunit=fileunit, file=filename)
    do i = 1, nlines
      read(fileunit, fmt=*, end=1) x(i), y(i)
    end do
    1 close(fileunit)
  end subroutine read_test_points

  subroutine write_test_points(filename, x, y, z, ic)
    ! Write test points, specfun and isclose values.

    character(len=*), intent(in) :: filename
    real(real64), intent(in), allocatable :: x(:), y(:), z(:)
    logical, intent(in), allocatable :: ic(:)
    integer :: fileunit, i

    open(newunit=fileunit, file=filename)
    do i = 1, size(x)
      write(fileunit, fmt=*) x(i), y(i), z(i), ic(i)
    end do
    close(fileunit)
  end subroutine write_test_points

end module mod_io
