#include "lib.cpp"
#include <iostream>

int
main ( void )
{
  EldaClass *ec = new EldaClass ();
  ec->set_int ( 4 );
  std::cout << ec->get_int () << std::endl;
  delete ec;
  return 0;
}
