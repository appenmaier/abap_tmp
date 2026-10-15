CLASS lhc_ZR_39_TravelTP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS ValidateDates FOR VALIDATE ON SAVE
       keys FOR Travel~ValidateDates.

ENDCLASS.


CLASS lhc_ZR_39_TravelTP IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateDates.
    " Read new Travels
    READ ENTITY IN LOCAL MODE ZR_39_TravelTP
         FIELDS ( BeginDate EndDate )
         WITH CORRESPONDING #( keys )
         RESULT DATA(travels).

    " Process new Travels
    LOOP AT travels INTO DATA(travel).
      " Validate Dates
      IF travel-EndDate < travel-BeginDate.
        " Create Error Message
        DATA(message) = NEW /dmo/cm_flight_messages( textid     = /dmo/cm_flight_messages=>begin_date_bef_end_date
                                                     begin_date = travel-begindate
                                                     end_date   = travel-enddate
                                                     severity   = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky = travel-%tky
                        %msg = message ) TO reported-travel.

        APPEND VALUE #( %tky = travel-%tky ) TO failed-travel.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
