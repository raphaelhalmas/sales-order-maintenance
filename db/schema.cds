namespace salesordermaintenance;

using { managed, sap.common.CodeList } from '@sap/cds/common';

entity UnitOfMeasureCodeList : CodeList {
    key code : String(2);
}

type UnitOfMeasure : Association to one UnitOfMeasureCodeList;

entity Material : managed {
    key ID      : UUID  @(Core.Computed : true);
    number      : String(18);
    description : String;
    baseUnit    : UnitOfMeasure;
}