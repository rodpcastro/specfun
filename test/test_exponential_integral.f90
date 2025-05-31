module test_exponential_integral
! Test of exponential integrals Ei and E1.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 30-05-2025 - Rodrigo Castro - Original code

  use wildf_kinds, only: wp
  use testdrive, only : new_unittest, unittest_type, error_type, check
  use specfun_evaluation, only: eval_write
  use exponential_integral, only: ei, e1

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

    pure real(wp) function e1x(x) 
      real(wp), intent(in) :: x
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

    pure complex(wp) function e1z(z) 
      complex(wp), intent(in) :: z
      e1z = e1(z)
    end function e1z

  end subroutine test_e1z

end module test_exponential_integral
