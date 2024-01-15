using {com.dhl as dhl} from '../db/schema';

service SalesOrders {
    entity HeaderSales  as select from dhl.HeaderSales;
    entity SalesItems   as select from dhl.SalesItems;
    entity UnitOfMesure as select from dhl.UnitOfMesure;
    
}

Service ReadOrders{

    entity GetOrders as projection on dhl.HeaderSales;
    entity GetItems as projection on dhl.SalesItems;
    
    
}


Service CreateOrders{
    entity CreateOrders as projection on dhl.HeaderSales;
    entity CreateItem as projection on dhl.SalesItems;
}


define service SalesOrders2{

    entity Header as select from dhl.HeaderSales {
       /* //ID as Order_Number @mandatory,
        email @mandatory,
        firstname,
        lastname,
        country as Country,
        createon,
        deliverydate,
        orderstatus,
        imagenurl as Imagen
        //item*/
        email @mandatory,
        firstname,
        lastname,
        country as Country,
        createon,
        deliverydate,
        orderstatus,
        imagenurl as Imagen,
        *

    };

    entity Items as select from dhl.SalesItems {
       // ID as Item_Number,
       // email,
       // posicion,
      /*  name as Name,
        description,
        releasedate,
        discontinuedate,
        price,
        height,
        weidth,
        depth,
        quantity,
        unitofmesure as tounitofmesure @mandatory,
        //Header*/
        name as Name,
        *,
        unitofmesure as tounitofmesure @mandatory,
        
    };
    @readonly
    entity unitofmesure as select from dhl.UnitOfMesure{
        ID_Mesure,
        name        
    };
      @readonly
      entity orderstatus as select from dhl.orderstatus{
          id,
          status
      };

      @readonly
      entity Countries_d as select from dhl.V_Country{
          code,
          name
       };
   entity customer as select from dhl.Customer{
     name,
     Adress,
     Phone,
     email
   }
   }
   