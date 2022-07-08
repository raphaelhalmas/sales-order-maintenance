using { salesordermaintenance } from '../db/schema';

@path: 'service/salesorder'
@(requires: 'authenticated-user')
service SalesOrderService {
    entity Material @(restrict : [{
        grant : [ 'READ' ],
        to : [ 'Viewer' ]
    },
    {
        grant : [ '*' ],
        to : [ 'Admin' ]
    }])
        as projection on salesordermaintenance.Material;
        annotate Material with @odata.draft.enabled;

    entity UnitOfMeasure @(restrict : [{
        grant : [ 'READ' ],
        to : [ 'Viewer' ]
    },
    {
        grant : [ '*' ],
        to : [ 'Admin' ]
    }])
        as projection on salesordermaintenance.UnitOfMeasure;

    entity Division @(restrict : [{
        grant : [ 'READ' ],
        to : [ 'Viewer' ]
    },
    {
        grant : [ '*' ],
        to : [ 'Admin' ]
    }])
        as projection on salesordermaintenance.Division;
}