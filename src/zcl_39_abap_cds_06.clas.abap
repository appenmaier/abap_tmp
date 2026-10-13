CLASS zcl_39_abap_cds_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_39_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z39_CustomerKPIs( p_city = 'Berlin' )
      FIELDS *
      INTO TABLE @DATA(customers).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
