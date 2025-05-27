module header
! Module header template.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! dd-mm-yyyy - Rodrigo Castro - Original code
!
! References
! ----------
! [1] Author. Year. Title. URL

  use, intrinsic :: iso_fortran_env, only: real64

  implicit none
  private
  public :: phi, get_and_display

  real(real64), parameter :: phi = 1.618033988749894d0  ! Golden ratio

contains

  subroutine get_and_display()
    ! Example procedure.

    character(100) :: user_input

    print *, 'Enter some text: '
    read *, user_input
    print *, 'You entered: ', trim(user_input)
  end subroutine get_and_display

end module header
