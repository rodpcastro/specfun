module example_constants
! Displaying constants and infinity.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 30-05-2025 - Rodrigo Castro - Original code

  use constants

  implicit none
  private
  public :: example_const, example_inf
  
contains

  subroutine example_const()
    print '(a)', '---------'
    print '(a)', 'Constants'
    print '(a)', '---------'
    print '(a, es22.15)', 'pi = ', pi
    print '(a, es22.15)', 'gm = ', gm
  end subroutine example_const

  subroutine example_inf()
    print '(a)', '-----------'
    print '(a)', '+- Infinity'
    print '(a)', '-----------'
    print '(a, sp, g0)', 'negative infinity: ', ninf()
    print '(a, sp, g0)', 'positive infinity: ', pinf()
  end subroutine example_inf

end module example_constants
