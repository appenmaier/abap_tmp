CLASS zcl_39_abap_cds_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_39_abap_cds_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z39_CustomerWithTravels
      FIELDS \_Travels-Description, \_Travels-BeginDate, \_Travels-EndDate, FirstName, LastName
      INTO TABLE @DATA(travels).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( travels ).
    out->write( lines( travels ) ).
  ENDMETHOD.
ENDCLASS.
