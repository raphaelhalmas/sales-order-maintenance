using SalesOrderService from './sales-order-service';

annotate SalesOrderService.Material with {
	number      @title: 'Material';
	description @title: 'Description';
    baseUnit    @title: 'Base Unit of Measure';
    division    @title: 'Divison';
}

annotate SalesOrderService.UnitOfMeasure with {
    code        @title: 'Code';
    description @title: 'Description';
}

annotate SalesOrderService.Division with {
    code        @title: 'Code';
    description @title: 'Description';
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
            {Value: division_code}
		],
        Facets: [
            {$Type: 'UI.ReferenceFacet', Label: 'General data', Target: '@UI.FieldGroup#GeneralData'}
        ],
        FieldGroup#GeneralData: {
            Data: [
                {Value: baseUnit_code},
                {Value: division_code}
            ]
        }        
	}
) 
{

}

annotate SalesOrderService.Material with {
    baseUnit @(
        Common: {
            Text: baseUnit.description, TextArrangement: #TextFirst,
            ValueList: {
                Label: 'Base Unit of Measure',
                CollectionPath: 'UnitOfMeasure',
                Parameters: [
                    { 
                        $Type: 'Common.ValueListParameterInOut',
                        LocalDataProperty: baseUnit_code,
                        ValueListProperty: 'code'
                    },
                    { 
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description'
                    }
                ]
            }
        }
    );

    division @(
        Common: {
            Text: division.description, TextArrangement: #TextFirst,
            ValueList: {
                Label: 'Division',
                CollectionPath: 'Division',
                Parameters: [
                    { 
                        $Type: 'Common.ValueListParameterInOut',
                        LocalDataProperty: division_code,
                        ValueListProperty: 'code'
                    },
                    { 
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description'
                    }
                ]
            }
        }
    )    
}

annotate SalesOrderService.UnitOfMeasure with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Unit of Measure',
            TypeNamePlural: 'Unit of Measures',
            Title: {
                $Type : 'UI.DataField',
                Value : code
            },
			Description : {
				$Type: 'UI.DataField',
				Value: description
			}            
        },
        LineItem: [
            {Value: code},
            {Value: description}
        ]
    }
) 
{

}

annotate SalesOrderService.Division with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Division',
            TypeNamePlural: 'Divisions',
            Title: {
                $Type : 'UI.DataField',
                Value : code
            },
			Description : {
				$Type: 'UI.DataField',
				Value: description
			}            
        },
        LineItem: [
            {Value: code},
            {Value: description}
        ]
    }
) 
{

}