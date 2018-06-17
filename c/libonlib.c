#include "libonlib.h"

void
four ( void )
{
  struct EldaClass *ec = newEldaClass ();
  EldaClass_set_int ( ec, 4 );
  printf ( "%i\n", EldaClass_get_int ( ec ) );
  deleteEldaClass ( ec );
}

void
five ( void )
{
  struct EldaClass *ec = newEldaClass ();
  EldaClass_set_int ( ec, 5 );
  printf ( "%i\n", EldaClass_get_int ( ec ) );
  deleteEldaClass ( ec );
}
