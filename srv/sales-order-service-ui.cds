using SalesOrderService from './sales-order-service';

annotate SalesOrderService.Material with {
	number      @title: 'Material';
	description @title: 'Description';
    baseUnit    @title: 'Base Unit of Measure';
}

annotate SalesOrderService.UnitOfMeasure with {
    code @title: 'Code';
    name @(
        UI.Hidden
    );    
    descr @title: 'Description';
}

annotate SalesOrderService.Material with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Material',
			TypeNamePlural: 'Materials',
			Title: {
                $Type : 'UI.DataField',
                Value : number
            },
			Description : {
				$Type: 'UI.DataField',
				Value: description
			}
		},
		LineItem: [
			{Value: number},
			{Value: description},
            {Value: baseUnit_code},
		],
        Facets: [
            {$Type: 'UI.ReferenceFacet', Label: 'General data', Target: '@UI.FieldGroup#GeneralData'}
        ],
        FieldGroup#GeneralData: {
            Data: [
                {Value: baseUnit_code},
            ]
        }        
	}
) 
{

};

annotate SalesOrderService.Material with {
    baseUnit @(
        Common: {
            Text: baseUnit.descr, TextArrangement: #TextFirst,
            ValueList: {
                Label: 'Base Unit of Measure',
                CollectionPath: 'UnitOfMeasure',
                Parameters: [
                    { $Type: 'Common.ValueListParameterInOut',
                        LocalDataProperty: baseUnit_code,
                        ValueListProperty: 'code'
                    },
                    { $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'descr'
                    }
                ]
            }
        }
    );
}

