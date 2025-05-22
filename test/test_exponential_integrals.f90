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

  implicit none
  private
  public :: collect_ei_tests
  
contains

  subroutine collect_ei_tests(testsuite)
    type(unittest_type), allocatable, intent(out) :: testsuite(:)

    testsuite = [ &
      new_unittest("test_ei_subdomain1", test_ei_subdomain1), &
      new_unittest("test_ei_subdomain2", test_ei_subdomain2) &
    ]
  end subroutine collect_ei_tests

  subroutine test_ei_subdomain1(error)
    type(error_type), allocatable, intent(out) :: error
    real(real64) :: refval, eival, reldif
    refval = -0.30266853926582593d0
    eival = ei(0.3d0)
    call check(error, isclose(eival, refval))
    if (allocated(error)) return
  end subroutine test_ei_subdomain1

  subroutine test_ei_subdomain2(error)
    type(error_type), allocatable, intent(out) :: error
    real(real64) :: refval, eival, reldif
    refval = 1.058563689713169d+20
    eival = ei(50.0d0)
    call check(error, isclose(eival, refval))
    if (allocated(error)) return
  end subroutine test_ei_subdomain2

  ! real(real64) :: ei_t1, ei_t2, e1x_t1, e1x_t2, &
  !                 e1z_t1, e1z_t2, e1z_t3, e1_t1, e1_t2
  !
  ! ei_t1 = abs(-0.30266853926582593d0 - ei(0.3d0)) / abs(-0.30266853926582593d0)
  ! ei_t2 = abs(1.058563689713169d+20 - ei(50.0d0)) / abs(1.058563689713169d+20)
  ! e1x_t1 = abs(0.55977359477616084d0 - e1x(0.5d0)) / abs(0.55977359477616084d0)
  ! e1x_t2 = abs(0.10001958240663265d0 - e1x(1.5d0)) / abs(0.10001958240663265d0)
  ! e1z_t1 = abs((-0.014529959529202443d0, -0.015866824826503003d0) - e1z((2.5d0, 1.8d0))) / &
  !          abs((-0.014529959529202443d0, -0.015866824826503003d0))
  ! e1z_t2 = abs((0.75128638206377318d0, -57.45565336638456d0) - e1z((-6.4d0, -8.9d0))) / &
  !          abs((0.75128638206377318d0, -57.45565336638456d0))
  ! e1z_t3 = abs((-4.2432089533906728d-6, -7.7188970166104144d-6) - e1z((9.1d0, 7.7d0))) / &
  !          abs((-4.2432089533906728d-6, -7.7188970166104144d-6))
  ! e1_t1 = abs(e1(0.958d0) - e1x(0.958d0))
  ! e1_t2 = abs(e1((2.789d0, 5.010d0)) - e1z((2.789d0, 5.010d0)))
  !
  ! print *, 'ei_t1 = ', ei_t1
  ! print *, 'ei_t2 = ', ei_t2
  ! print *, 'e1x_t1 = ', e1x_t1
  ! print *, 'e1x_t2 = ', e1x_t2
  ! print *, 'e1z_t1 = ', e1z_t1
  ! print *, 'e1z_t2 = ', e1z_t2
  ! print *, 'e1z_t3 = ', e1z_t3
  ! print *, 'e1_t1 - ', e1_t1
  ! print *, 'e1_t2 - ', e1_t2

  end module test_exponential_integrals
