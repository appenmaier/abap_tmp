CLASS zcl_abap_test DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_abap_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        out->write( zcl_abap_helper=>get_customer( customer_id = '999999' ) ).
      CATCH zcx_abap_no_data into data(x).
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        out->write( zcl_abap_helper=>get_travel( travel_id = '99999999' ) ).
      CATCH zcx_abap_no_data into x.
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        out->write( zcl_abap_helper=>get_travels( customer_id = '999999' ) ).
      CATCH zcx_abap_no_data into x.
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
