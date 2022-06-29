using { salesordermaintenance } from '../db/schema';

@path: 'service/salesorder'
service SalesOrderService {
    entity Material @(restrict : [{
        grant : [ 'READ' ],
        to : [ 'Viewer' ]
    },
    {
        grant : [ '*' ],
        to : [ 'Manager' ]
    }])
        as projection on salesordermaintenance.Material;
        annotate Material with @odata.draft.enabled;

    entity UnitOfMeasure @(restrict : [{
        grant : [ 'READ' ],
        to : [ 'Viewer' ]
    },
    {
        grant : [ '*' ],
        to : [ 'Manager' ]
    }])
        as projection on salesordermaintenance.UnitOfMeasure;
        annotate UnitOfMeasure with @odata.draft.enabled;

    entity Division @(restrict : [{
        grant : [ 'READ' ],
        to : [ 'Viewer' ]
    },
    {
        grant : [ '*' ],
        to : [ 'Manager' ]
    }])
        as projection on salesordermaintenance.Division;
        annotate Division with @odata.draft.enabled;
}