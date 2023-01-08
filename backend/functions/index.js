const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors({ origin: true }));
var serviceAccount = require("./permissions.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://fir-api-9a206..firebaseio.com"
});
const db = admin.firestore();

app.get('/hello-world', (req, res) => {
  return res.status(200).send('Hello World!');
});

app.post('/register', (req, res) => {
    (async () => {
        try {
          await db.collection("Users").doc('/' + req.body.email + '/')
              .create({password: req.body.password, name: req.body.name});
          await db.collection(req.body.email).doc('/cart/')
              .create({});
          return res.status(200).send();
        } catch (error) {
          console.log(error);
          return res.status(500).send(error);
        }
      })();
  });

  app.post('/signin', (req, res) => {
    (async () => {
        try {
          let item = await db.collection("Users").doc('/' + req.body.email + '/').get();
          let response = item.data();
          if(response.password == req.body.password){
              return res.status(200).send("Successfully Signed In");
          }
          return res.status(500).send("Wrong username/password ");
        } catch (error) {
          console.log(error);
          return res.status(500).send(error);
        }
      })();
  });

app.post('/cart', (req, res) => {
    (async () => {
        try {
          await db.collection(req.body.email).doc('/cart/')
              .create({details: req.body.value});
          return res.status(200).send();
        } catch (error) {
          console.log(error);
          return res.status(500).send(error);
        }
      })();
  });

  // read item
app.get('/cart', (req, res) => {
    (async () => {
        try {
            const document = db.collection(req.body.email).doc('/cart/')
            let item = await document.get();
            let response = item.data();
            return res.status(200).send(response);
        } catch (error) {
            console.log(error);
            return res.status(500).send(error);
        }
        })();
    });

// read all
app.get('/items', (req, res) => {
    (async () => {
        try {
            let query = db.collection('items');
            let response = [];
            await query.get().then(querySnapshot => {
            let docs = querySnapshot.docs;
            for (let doc of docs) {
                const selectedItem = {
                    id: doc.id,
                    item: doc.data().item
                };
                response.push(selectedItem);
            }
            });
            return res.status(200).send(response);
        } catch (error) {
            console.log(error);
            return res.status(500).send(error);
        }
        })();
    });

// update
app.put('/cart/update', (req, res) => {
(async () => {
    try {
        const document = db.collection(req.body.email).doc(req.body.cart);
        let item = await document.get();
        let response = item.data();
        await document.update({
            item: req.body.value
        });
        return res.status(200).send();
    } catch (error) {
        console.log(error);
        return res.status(500).send(error);
    }
    })();
});

// delete
app.delete('/api/delete/:item_id', (req, res) => {
(async () => {
    try {
        const document = db.collection('items').doc(req.params.item_id);
        await document.delete();
        return res.status(200).send();
    } catch (error) {
        console.log(error);
        return res.status(500).send(error);
    }
    })();
});
exports.app = functions.https.onRequest(app);