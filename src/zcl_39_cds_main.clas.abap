CLASS zcl_39_cds_main DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_39_cds_main IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM /DMO/I_Flight_R
      FIELDS *
      WHERE AirlineID = 'LH'
      INTO TABLE @DATA(flights).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
