program tester
! Test of WildF results against mpmath, assuring at least 8 digits of precision.
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
! [1] The Fortran Programming Language. 2024. test-drive: The simple 
!     testing framework. https://github.com/fortran-lang/test-drive
! [2] The mpmath development team. 2023. mpmath: a Python library for
!     arbitrary-precision floating-point arithmetic. https://mpmath.org/

  use, intrinsic :: iso_fortran_env, only : error_unit
  use testdrive, only : run_testsuite, new_testsuite, testsuite_type
  use test_exponential_integral, only : collect_exponential_integral_tests
  use test_numerror, only: collect_numerror_tests

  implicit none
  integer :: stat, is
  type(testsuite_type), allocatable :: testsuites(:)
  character(len=*), parameter :: fmt = '("#", *(1x, a))'

  stat = 0

  testsuites = [ &
    new_testsuite("numerror_suite", collect_numerror_tests), &
    new_testsuite("exponential_integral_suite", collect_exponential_integral_tests) &
    ]

  do is = 1, size(testsuites)
    write(error_unit, fmt) "Testing:", testsuites(is)%name
    call run_testsuite(testsuites(is)%collect, error_unit, stat)
  end do

  if (stat > 0) then
    write(error_unit, '(i0, 1x, a)') stat, "test(s) failed!"
    error stop
  end if

end program tester
