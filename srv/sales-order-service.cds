using { salesordermaintenance } from '../db/schema';

@path: 'service/salesorder'
service SalesOrderService {
    entity Material as projection on salesordermaintenance.Material;
        annotate Material with @odata.draft.enabled;

    @readonly
    entity UnitOfMeasure as projection on salesordermaintenance.UnitOfMeasureCodeList;
}