using SalesOrders2 as service from '../../srv/SalesOrders';

annotate service.Header with @(
    UI.LineItem : [
         {
            $Type : 'UI.DataField',
            Label : 'Imagen',
            Value : Imagen,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstname',
            Value : firstname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastname',
            Value : lastname,
        },
         {
                $Type : 'UI.DataField',
                Label : 'orderstatus',
                Value : orderstatus,
                Criticality : orderstatus,
            },
          
        {
            $Type : 'UI.DataField',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'createon',
            Value : createon,
        },
    ],
     UI.SelectionFields : [
        Country_code,
        createon,
        deliverydate,
        orderstatus

    ]
);
annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
              {
                $Type : 'UI.DataField',
                Label : 'imagenurl',
                Value : Imagen,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'firstname',
                Value : firstname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastname',
                Value : lastname,
            },
             {
                $Type : 'UI.DataField',
                Label : 'orderstatus',
                Value : orderstatus,
            },
          
            {
                $Type : 'UI.DataField',
                Value : country_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'createon',
                Value : createon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliverydate',
                Value : deliverydate,
            },
           
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);


//Anotacion para la imagen

annotate service.Header with {
    Imagen @(UI.IsImageURL : true)
};


//Ayudas de Búsqueda
annotate service.Header with {

    orderstatus @(Common : {
        Text                     : {
            $value                 : orderstatus,
            ![@UI.TextArrangement] : #TextOnly,
        },
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'orderstatus',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : orderstatus,
                    ValueListProperty : 'id'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    //LocalDataProperty : orderstatus,
                    ValueListProperty : 'status'
                }
            ]
        }
    });

    Country     @(Common : {
        Text                     : {
            $value                 : Country_code,
            ![@UI.TextArrangement] : #TextOnly,
        },
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'Countries_d',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Country_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    //LocalDataProperty : Country_code,
                    ValueListProperty : 'name'
                }
            ]
        }
    });
};


//Anotamos las listas

annotate service.orderstatus with {
    id     @(
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : status,
            ![@UI.TextArrangement] : #TextOnly,
        }}
    );
    status @(UI : {HiddenFilter : true});

}

annotate service.Countries_d with {
    code @(
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly,
        }}
    );
    name @(UI : {HiddenFilter : true});

};

// Anotacion para contacto

annotate service.customer with @(Communication : {Contact : {
    $Type : 'Communication.ContactType',
    fn    : name,
    role  : 'Customer',
    photo : 'sap-icon://Customer',
    email : [{
        type    : #work,
        address : email
    }],
    tel   : [{
        type : #work,
        uri  : Phone

    }]
}});
