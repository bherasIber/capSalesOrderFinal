using {com.bhp as bhp} from '../db/schema';

service SalesOrders {
    entity HeaderSales  as select from bhp.HeaderSales;
    entity SalesItems   as select from bhp.SalesItems;
    entity UnitOfMesure as select from bhp.UnitOfMesure;
    
}

Service ReadOrders{

    entity GetOrders as projection on bhp.HeaderSales;
    entity GetItems as projection on bhp.SalesItems;
    
    
}


Service CreateOrders{
    entity CreateOrders as projection on bhp.HeaderSales;
    entity CreateItem as projection on bhp.SalesItems;
}


define service SalesOrders2{

    entity Header as select from bhp.HeaderSales {
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

    entity Items as select from bhp.SalesItems {
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
    entity unitofmesure as select from bhp.UnitOfMesure{
        ID_Mesure,
        name        
    };
      @readonly
      entity orderstatus as select from bhp.orderstatus{
          id,
          status
      };

      @readonly
      entity Countries_d as select from bhp.V_Country{
          code,
          name
       };
   entity customer as select from bhp.Customer{
     name,
     Adress,
     Phone,
     email
   }
   }
   