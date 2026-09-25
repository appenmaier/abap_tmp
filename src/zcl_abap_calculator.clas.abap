CLASS zcl_abap_calculator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS calculate_power
      IMPORTING !base         TYPE zabap_decimal
                !exponent     TYPE zabap_decimal DEFAULT 2
      RETURNING VALUE(result) TYPE zabap_decimal
      RAISING   zcx_abap_value_too_high.
ENDCLASS.


CLASS zcl_abap_calculator IMPLEMENTATION.
  METHOD calculate_power.
    IF exponent > 4.
      RAISE EXCEPTION NEW zcx_abap_value_too_high( value = exponent ).
    ENDIF.

    result = base ** exponent.
  ENDMETHOD.
ENDCLASS.
