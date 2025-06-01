program examples
! Simple tests for internal procedures and special functions.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 30-05-2025 - Rodrigo Castro - Original code

  use example_module_template
  use example_constants
  use example_numerror
  use example_exponential_integral

  implicit none
  
  call example_mod_template()
  call example_const()
  call example_inf()
  call example_ismall()
  call example_isclose()
  ! call example_ei()
  ! call example_e1x()
  ! call example_e1z()

end program examples
