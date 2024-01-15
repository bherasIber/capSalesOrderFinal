cds = require("@sap/cds");
const { HeaderSales } = cds.entities("com.bhp");
const { SalesItems } = cds.entities("com.bhp");
module.exports = (srv) => {
    //************READ******/

    srv.on("READ", "GetOrders", async (req) => {
        if (req.data.ID !== undefined && req.data.email !== undefined) {
            return await SELECT.from`com.bhp.HeaderSales`
                .where`email = ${req.data.email}`;
        }
        return await SELECT.from(HeaderSales);
    })


    srv.on("READ", "GetItems", async (req) => {
        //  if (req.data.ID !== undefined) {
        // return await SELECT.from`com.bhp.SalesItems`;
        return await SELECT.from(SalesItems);
        // const.where`ID = ${req.data.ID}`;
        //       }
        // return await SELECT.from(SalesItems);
    })


    srv.after("READ", "GetOrders", (data) => {

        let cont = 0;
        for (let value of data) {

            if (data[cont].createon == '') {

                data[cont].createon = new Date();

                data[cont].orderstatus = '0';



            } else if (Date.now() < data[cont].createon) {
                data[cont].orderstatus = '1';

            } else {

                data[cont].orderstatus = '2';
            }

            console.log(data[0].email);
            cont = cont + 1;
        }
        console.log(data);
        // if ( value.ClientEmail == 'client2@cliente2.com'){

        // data.data[  cont  ].Status = 'A';  
        //  }
        // 
        //   }
        return data;

        // return data.map((order) => (order.Reviewed = true));
    });

    //****************CREATE ORDER */

    srv.on("CREATE", "CreateOrders", async (req) => {
        let Data = await cds
            .transaction(req)   // Generamos una nueva funcion y con el run la llamamos 
            .run(
                INSERT.into(HeaderSales).entries({
                    email: req.data.email,
                    firstName: req.data.firstName,
                    lastname: req.data.lastname,
                    country_code: req.data.country,
                    createon: req.data.createon,
                    deliverydate: req.data.deliverydate,
                    orderstatus: req.data.orderstatus,
                    imagenurl: req.data.imagenurl,
                })
            )
            .then((resolve, reject) => {       //Aqui se recibe la informacion https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.data;
                } else {
                    req.error(409, "Record Not Inserted");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Vemos si de graba ", Data);
        return Data;
    });


    srv.on("CREATE", "CreateItem", async (req) => {
        let item = await cds
            .transaction(req)   // Generamos una nueva funcion y con el run la llamamos 
            .run(
                INSERT.into`com.bhp.SalesItems`.entries({
                    name: req.data.name,
                    description: req.data.description,
                    releasedate: req.data.releasedate,
                    discontinuedate: req.data.discontinuedate,
                    price: req.data.price,
                    height: req.data.height,
                    weidth: req.data.weidth,
                    depth: req.data.depth,
                    quantity: req.data.quantity,
                    unitofmesure: req.data.unitofmesure,
                    Header_ID: req.data.Header_ID,
                    Header_email: req.data.Header_email,
                })
            )
            .then((resolve, reject) => {       //Aqui se recibe la informacion https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.item;
                } else {
                    req.error(409, "Record Not Inserted");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Vemos si de graba ", item);
        return item;
    });



    //************UPDATE******/
    srv.on("UPDATE", "UpdateOrders", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run([
                UPDATE(Orders, req.data.ClientEmail).set({
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName,
                }),
            ])
            .then((resolve, reject) => {
                console.log("Resolve: ", resolve);
                console.log("Reject: ", reject);

                if (resolve[0] == 0) {
                    req.error(409, "Record Not Found");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });



};
