CLASS zcl_39_cds_main DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_39_cds_main IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customers TYPE TABLE OF /dmo/customer.

    " ABAP CDS
    SELECT FROM /DMO/I_Flight_R
      FIELDS *
      WHERE AirlineID = 'LH'
      INTO TABLE @DATA(flights).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( flights ).

    " Views with Parameters
    SELECT
      FROM Z39_Demo07( P_CarrierId = 'LH' )
      FIELDS *
*      WHERE carrier_id = 'LH'
      INTO TABLE @DATA(flights2).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( flights2 ).

    " Path Expressions
    SELECT FROM Z39_Demo09
      FIELDS CarrierId,
             ConnectionId,
             \_Carrier-name AS CarrierName
      INTO TABLE @DATA(connections).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( connections ).

    " Access Controls
    SELECT FROM /dmo/customer
      FIELDS *
      INTO @DATA(customer).

      AUTHORITY-CHECK OBJECT '/DMO/TRVL'
                      ID '/DMO/CNTRY' FIELD customer-country_code
                      ID 'ACTVT' FIELD '03'.
      IF sy-subrc = 0.
        APPEND customer TO customers.
      ELSE.
        out->write( customer-country_code ).
      ENDIF.
    ENDSELECT.

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
