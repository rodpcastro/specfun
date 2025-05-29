module test_exponential_integral
!* Simple test of special functions.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
!* 25-05-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use testdrive, only : new_unittest, unittest_type, error_type, check
  use exponential_integral, only: ei, e1
  use specfun_evaluation, only: eval_write

  implicit none
  private
  public :: collect_exponential_integral_tests
  
contains

  subroutine collect_exponential_integral_tests(testsuite)
    type(unittest_type), allocatable, intent(out) :: testsuite(:)

    testsuite = [ &
      new_unittest("test_ei", test_ei), &
      new_unittest("test_e1x", test_e1x), &
      new_unittest("test_e1z", test_e1z) &
    ]
  end subroutine collect_exponential_integral_tests

  subroutine test_ei(error)
    type(error_type), allocatable, intent(out) :: error
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: file
    
    file = 'exponential_integral_ei.csv'
    call eval_write(ei, file, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return
  end subroutine test_ei

  subroutine test_e1x(error)
    type(error_type), allocatable, intent(out) :: error
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: file
    
    file = 'exponential_integral_e1x.csv'
    call eval_write(e1x, file, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return

  contains

    pure real(real64) function e1x(x) 
      real(real64), intent(in) :: x
      e1x = e1(x)
    end function e1x

  end subroutine test_e1x

  subroutine test_e1z(error)
    type(error_type), allocatable, intent(out) :: error
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: file
    
    file = 'exponential_integral_e1z.csv'
    call eval_write(e1z, file, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return

  contains

    pure complex(real64) function e1z(z) 
      complex(real64), intent(in) :: z
      e1z = e1(z)
    end function e1z

  end subroutine test_e1z

end module test_exponential_integral
