#ifndef __ELDA_WRAPPER_H
#define __ELDA_WRAPPER_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct EldaClass EldaClass;

EldaClass* newEldaClass ( void );

void EldaClass_set_int ( EldaClass *ec, int value );

int EldaClass_get_int ( EldaClass *ec );

void deleteEldaClass ( EldaClass *ec );

#ifdef __cplusplus
}
#endif /* extern "C" */
#endif /* __ELDA_WRAPPER_H */
