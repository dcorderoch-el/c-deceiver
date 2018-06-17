#include "wrapper.h"
#include <stdio.h>

int
main ( void )
{
  struct EldaClass *ec = newEldaClass ();
  EldaClass_set_int ( ec, 4 );
  printf ( "%i\n", EldaClass_get_int ( ec ) );
  deleteEldaClass ( ec );
  return 0;
}
