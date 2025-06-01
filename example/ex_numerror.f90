module example_numerror
! Usage example of numerror functions.

  use wildf_kinds, only: wp
  use wildf_numerror, only: ismall, isclose 

  implicit none
  private
  public :: example_ismall, example_isclose

contains
  
  subroutine example_ismall()
    print '(a)', '----------------'
    print '(a)', 'numerror: ismall'
    print '(a)', '----------------'
    print '(a, l)', 'ismall(1.0e-16) = ', ismall(1.0e-16_wp)
    print '(a, l)', 'ismall(1.0e-16, 1.0e-1) = ', ismall(1.0e-16_wp, 1.0e-1_wp)
  end subroutine example_ismall

  subroutine example_isclose()
    print '(a)', '-----------------'
    print '(a)', 'numerror: isclose'
    print '(a)', '-----------------'
    print '(a, l)', 'isclose(1.0e-8, 1.1e-8) = ', isclose(1.0e-8_wp, 1.1e-8_wp)
    print '(a, l)', 'isclose(1.0e-8, 2.1e-8) = ', isclose(1.0e-8_wp, 2.1e-8_wp)
    print '(a, l)', 'isclose(123456789.0, 123456788.0) = ', isclose(123456789.0_wp, 123456788.0_wp)
    print '(a, l)', 'isclose(123456789.0, 123456787.0) = ', isclose(123456789.0_wp, 123456787.0_wp)
  end subroutine example_isclose

end module example_numerror
