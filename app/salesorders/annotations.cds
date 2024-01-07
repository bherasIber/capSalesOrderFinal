using ManageOrders as service from '../../srv/orders.service';

annotate service.Header with @(
    UI.SelectionFields: [
FirstName,
LastName
    ],

    Capabilities : [{
        InsertRestrictions: {
            $Type: 'Capabilities.InsertRestrictionsType',
            Insertable
        }
    },],
    
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Email',
            Value: Email,
        },
        {
            $Type: 'UI.DataField',
            Label: 'FirstName',
            Value: FirstName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'LastName',
            Value: LastName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: Country,
        },
    ]
);

annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ID',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Email',
                Value: Email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'FirstName',
                Value: FirstName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'LastName',
                Value: LastName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Country',
                Value: Country,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CreatedOn',
                Value: CreatedOn,
            },
            {
                $Type: 'UI.DataField',
                Label: 'DeliveryDate',
                Value: DeliveryDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'OrderStatus',
                Value: OrderStatus,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ImageUrl',
                Value: ImageUrl,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
