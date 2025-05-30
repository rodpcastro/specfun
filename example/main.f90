program examples
! Simple tests for internal procedures and special functions.
!
! Author
! ------
! Rodrigo Castro (GitHub: rodpcastro)
!
! History
! -------
! 29-05-2025 - Rodrigo Castro - Original code

  use, intrinsic :: iso_fortran_env, only: real64
  use example_module_template, only: example_mod_template
  use example_infinity, only: example_inf
  use example_exponential_integral, only: example_ei, example_e1x, example_e1z

  implicit none
  
  call example_mod_template()
  call example_inf()
  call example_ei()
  call example_e1x()
  call example_e1z()

end program examples
