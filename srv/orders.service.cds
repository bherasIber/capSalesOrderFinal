using com.ama.logali as logali from '../db/schema';

service ManageOrders {
    entity Header as projection on logali.Header;
    entity Item as projection on logali.Items;
    
}