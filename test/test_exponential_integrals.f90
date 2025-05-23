module test_exponential_integrals
! Simple test of special functions.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 22-05-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use testdrive, only : new_unittest, unittest_type, error_type, check
  use exponential_integrals, only: ei
  use internal, only: isclose
  use mod_io, only: read_test_points, write_test_points
  use mod_alloc, only: alloc

  implicit none
  private
  public :: collect_ei_tests
  
contains

  subroutine collect_ei_tests(testsuite)
    type(unittest_type), allocatable, intent(out) :: testsuite(:)

    testsuite = [ &
      new_unittest("test_ei", test_ei) &
    ]
  end subroutine collect_ei_tests

  subroutine test_ei(error)
    type(error_type), allocatable, intent(out) :: error
    real(real64) :: refval, eival
    real(real64), allocatable :: refx(:), refy(:), specfuny(:)
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: filename
    integer :: fileunit, i
    
    filename = 'test/test_points/exponential_integrals_ei.csv'
    call read_test_points(filename, refx, refy)
    call alloc(specfuny, size(refx))
    allocate(specfun_ic(size(refx)))

    do i = 1, size(refx)
      specfuny(i) = ei(refx(i))
      specfun_ic(i) = isclose(refy(i), specfuny(i))
    end do
    
    filename = 'test/test_specfun/exponential_integrals_ei.csv'
    call write_test_points(filename, refx, refy, specfuny, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return
  end subroutine test_ei

end module test_exponential_integrals
