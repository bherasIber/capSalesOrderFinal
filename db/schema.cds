namespace com.ama.logali;

entity Header {
    key ID           : String(36);
        Email        : String(30);
        FirstName    : String(30);
        LastName     : String;
        Country      : String(30);
        CreatedOn    : Date;
        DeliveryDate : DateTime;
        OrderStatus  : Integer;
        ImageUrl     : String;

}

entity Items {
    key ID               : Association to Header;
        Name             : String(40);
        Description      : String(40);
        ReleaseDate      : Date;
        DiscontinuedDate : Date;
        Price            : Decimal(12, 2);
        Height           : Decimal(15, 3);
        Width            : Decimal(13, 3);
        Depth            : Decimal(12, 2);
        Quantity         : Decimal(16, 2);
        UnitOfMesure     : Association to UnitOfMesaures;
}

entity UnitOfMesaures {
    key ID          : String(2);
        Description : localized String;
}
