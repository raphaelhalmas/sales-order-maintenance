using SalesOrderService from './sales-order-service';

annotate SalesOrderService.Material with {
	number      @title: '{i18n>Material.Number}';
	description @title: '{i18n>Material.Description}';
    baseUnit    @title: '{i18n>Material.BaseUnit}';
    division    @title: '{i18n>Material.Division}';
}

annotate SalesOrderService.UnitOfMeasure with {
    code        @title: '{i18n>UnitOfMeasure.Code}';
    description @title: '{i18n>UnitOfMeasure.Description}';
}

annotate SalesOrderService.Division with {
    code        @title: '{i18n>Division.Code}';
    description @title: '{i18n>Division.Description}';
}

annotate SalesOrderService.Material with @(
	UI: {
		HeaderInfo: {
			TypeName: '{i18n>Material.UI.HeaderInfo.TypeName}',
			TypeNamePlural: '{i18n>Material.UI.HeaderInfo.TypeNamePlural}',
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
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Material.UI.Facets.Label}', Target: '@UI.FieldGroup#GeneralData'}
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
                Label: '{i18n>UnitOfMeasure.Common.ValueList.Label}',
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
                Label: '{i18n>Division.Common.ValueList.Label}',
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
            TypeName: '{i18n>UnitOfMeasure.UI.HeaderInfo.TypeName}',
            TypeNamePlural: '{i18n>UnitOfMeasure.UI.HeaderInfo.TypeNamePlural}',
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
            TypeName: '{i18n>Division.UI.HeaderInfo.TypeName}',
            TypeNamePlural: '{i18n>Division.UI.HeaderInfo.TypeNamePlural}',
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