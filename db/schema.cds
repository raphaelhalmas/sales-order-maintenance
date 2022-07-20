namespace salesordermaintenance;

using { cuid, managed } from '@sap/cds/common';

entity UnitOfMeasure : managed {
    key code    : String(2);
    description : localized String;
}

entity Division : managed {
    key code    : String(2);
    description : localized String;
}

entity Material : cuid, managed {
    number      : String(18);
    description : String;
    baseUnit    : Association to UnitOfMeasure;
    division    : Association to Division;
}