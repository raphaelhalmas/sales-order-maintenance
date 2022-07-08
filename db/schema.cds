namespace salesordermaintenance;

using { managed } from '@sap/cds/common';

entity UnitOfMeasure : managed {
    key code    : String(2);
    description : String;
}

entity Division : managed {
    key code    : String(2);
    description : String;
}

entity Material : managed {
    key ID      : UUID  @(Core.Computed : true);
    number      : String(18);
    description : String;
    baseUnit    : Association to UnitOfMeasure;
    division    : Association to Division;
}