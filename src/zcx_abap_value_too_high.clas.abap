CLASS zcx_abap_value_too_high DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    CONSTANTS:
      BEGIN OF zcx_abap_value_too_high,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_abap_value_too_high.

    DATA value TYPE i.

    METHODS constructor
      IMPORTING textid    LIKE if_t100_message=>t100key OPTIONAL
                !previous LIKE previous                 OPTIONAL
                !value    TYPE zabap_decimal.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_abap_value_too_high IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    " TODO: parameter TEXTID is never used (ABAP cleaner)

    super->constructor( previous = previous ).
    CLEAR me->textid.
    me->value = value.
    if_t100_message~t100key = zcx_abap_value_too_high=>zcx_abap_value_too_high.
  ENDMETHOD.
ENDCLASS.
