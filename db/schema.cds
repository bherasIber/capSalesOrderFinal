namespace com.bhp;


using {
    cuid,
    managed,
    Country
} from '@sap/cds/common';

type status : Integer enum {
    Submitted  = 1;
    Fullfiller = 2;
    Shipped    = 3;
    Cancel     = -1;
}

define entity HeaderSales : cuid {
        // @odata.Type : 'Edm.String'
        // key ID           : UUID not null;
    key email         : String(40) not null;
        firstname     : String(40);
        lastname      : String(40);
        country       : Country;
        tocountry     : Association to V_Country
                            on tocountry.code = country.code;
        //country      : String(30);
        createon      : Date default $now;
        deliverydate  : Date;
        orderstatus   : String(20);
        toorderstatus : Association to orderstatus
                            on toorderstatus.id = orderstatus;
        item          : Composition of many SalesItems
                            on item.Header = $self;
        imagenurl     : String(100);

}

define entity SalesItems : cuid {
    //@odata.Type : 'Edm.String'
    // key ID              : UUID not null;
    //key email           : String(40) not null;
    //key posicion        : Integer not null;
    name            : String(40);
    description     : String(40);
    releasedate     : DateTime default $now;
    discontinuedate : DateTime;
    price           : Decimal(12, 2);
    height          : Decimal(12, 2);
    weidth          : Decimal(15, 3);
    depth           : Decimal(12, 2);
    quantity        : Decimal(16, 2);
    unitofmesure    : String(2);
    tounitofmesure  : Association to UnitOfMesure
                          on tounitofmesure.ID_Mesure = unitofmesure;
    Header          : Association to HeaderSales;
}

define entity UnitOfMesure {
    ID_Mesure : String(2);
    name      : String;
}

define entity orderstatus {
    id     : Integer;
    status : String(15);
}

define entity V_Country {
    code : String(3);
    name : String(15);
}

define entity Customer {
    key name   : String(40);
        Adress : String(25);
        Phone  : String(25);
        email  : String(25)

}

/*define entity ItemSel as
  select from SalesItems {
    *,   (
      quantity * price
    ) as TotalPrice : Decimal(15, 2)
  };
  */
