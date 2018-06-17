#include "lib.h"
#include "../c/wrapper.h"

extern "C"
{
  EldaClass *newEldaClass ( void )
  {
    return new EldaClass ();
  }

  void EldaClass_set_int ( EldaClass *ec, int value )
  {
    ec->set_int ( value );
  }

  int EldaClass_get_int ( EldaClass *ec )
  {
    return ec->get_int ();
  }

  void deleteEldaClass ( EldaClass *ec )
  {
    delete ec;
  }
}
