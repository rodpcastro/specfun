module test_exponential_integrals
! Simple test of special functions.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 25-05-2025 - Rodrigo Castro - Original code

  use testdrive, only : new_unittest, unittest_type, error_type, check
  use exponential_integrals, only: ei, e1x, e1z
  use specfun_evaluation, only: eval_write

  implicit none
  private
  public :: collect_ei_tests
  
contains

  subroutine collect_ei_tests(testsuite)
    type(unittest_type), allocatable, intent(out) :: testsuite(:)

    testsuite = [ &
      new_unittest("test_ei", test_ei), &
      new_unittest("test_e1x", test_e1x), &
      new_unittest("test_e1z", test_e1z) &
    ]
  end subroutine collect_ei_tests

  subroutine test_ei(error)
    type(error_type), allocatable, intent(out) :: error
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: file
    
    file = 'exponential_integrals_ei.csv'
    call eval_write(ei, file, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return
  end subroutine test_ei

  subroutine test_e1x(error)
    type(error_type), allocatable, intent(out) :: error
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: file
    
    file = 'exponential_integrals_e1x.csv'
    call eval_write(e1x, file, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return
  end subroutine test_e1x

  subroutine test_e1z(error)
    type(error_type), allocatable, intent(out) :: error
    logical, allocatable :: specfun_ic(:)
    character(len=100) :: file
    
    file = 'exponential_integrals_e1z.csv'
    call eval_write(e1z, file, specfun_ic)

    call check(error, all(specfun_ic))
    if (allocated(error)) return
  end subroutine test_e1z

end module test_exponential_integrals
