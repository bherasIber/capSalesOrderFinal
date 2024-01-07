using com.ama.logali as logali from '../db/schema';

service ManageOrders {
    entity Header @( 
        Capabilities : {
            InsertRestrictions : {
                $Type : 'Capabilities.InsertRestrictionsType',
                Insertable
            },
            UpdateRestrictions : {
                $Type : 'Capabilities.UpdateRestrictionsType',
                Updatable
            },
            DeleteRestrictions : {
                $Type : 'Capabilities.DeleteRestrictionsType',
                Deletable
            },
        },
    )

     as select from logali.Header;
     annotate Header with @odata.draft.enabled;
    entity Item @( 
        Capabilities : {
            InsertRestrictions : {
                $Type : 'Capabilities.InsertRestrictionsType',
                Insertable
            },
            UpdateRestrictions : {
                $Type : 'Capabilities.UpdateRestrictionsType',
                Updatable
            },
            DeleteRestrictions : {
                $Type : 'Capabilities.DeleteRestrictionsType',
                Deletable
            },
        },
    )as projection on logali.Items;
    annotate Item with @odata.draft.enabled;
    
}