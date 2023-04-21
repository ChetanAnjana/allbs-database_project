import express from 'express';
import mysql from 'mysql2';
import data from './data.js';
import cors from 'cors';
import bodyParser from 'body-parser';
import jwt from 'jsonwebtoken'

const app = express();

app.use(cors());

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '9826512596',
  database: 'allbs'
});


// test database connection
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database:', err);
  } else {
    console.log('Connected to MySQL database!');
  }
});
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

app.get('/product/1', (req, res) => {
  // const productId = req.params.id;
  const searchTerm = req.query.search;
  
  // Build SQL query to retrieve product information
  const sql = `SELECT * FROM products WHERE id = ? AND name LIKE ?`;
  const params = [product_id, `%${searchTerm}%`];
  
  // Execute query and return results
  connection.query(sql, params, (error, results, fields) => {
    if (error) {
      res.status(500).send(error);
    } else {
      res.json(results);
    }
  });
})
app.get('/api/inventory/getall', (req, res) => {
  connection.query('SELECT * FROM inventory', (err, results) => {
    if (err) {
      console.error('Error getting inventory data:', err);
      res.status(500).send({ message: 'Server error' });
    } else {
      res.send(results);
    }
  });
});

app.put('/api/user', (req, res) => {
  const { name=null, user_year=null, email=null, password=null, p_pic=null } = req.body;
  const token = req.headers.authorization.split(' ')[1]; // get the token from the request headers
  const decodedToken = jwt.verify(token, 'secret_key'); // verify the token using your secret key
  const user_id = decodedToken.user_id;
  console.log(email);
  connection.query(
    'UPDATE user SET name = ?, user_year = ?, email = ?, password = ?, p_pic = ? WHERE user_id = ?',
    [name, user_year, email, password, p_pic, user_id],
    (err, results) => {
      if (err) {
        console.error('Error updating user:', err);
        res.status(500).send({ message: 'Server error' });
      } else {
        res.send({ message: 'User updated successfully' });
      }
    }
  );
});

// app.post('/api/signin', (req, res) => {
//   const { user_id = null, password = null} = req.body;
//   console.log(user_id);
//   console.log(password);
//   connection.query(
//     'SELECT * FROM user WHERE user_id = ? AND password = ?',
//     [user_id, password],
//     (err, results) => {
//       if (err) {
//         console.error('Error signing in:', err);
//         res.status(500).send({ message: 'Server error' });
//       } else if (results.length > 0) {
//         res.send({ message: 'Sign-in successful' });
//       } else {
//         res.status(401).send({ message: 'Invalid email or password' });
//       }
//     }
//   );
// });

app.post('/api/signin', (req, res) => {
  const { user_id = null, password = null} = req.body;
  console.log(user_id);
  console.log(password);
  connection.query(
    'SELECT * FROM user WHERE user_id = ? AND password = ?',
    [user_id, password],
    (err, results) => {
      if (err) {
        console.error('Error signing in:', err);
        res.status(500).send({ message: 'Server error' });
      } else if (results.length > 0) {
        const user = results[0];
        const token = jwt.sign({ user_id: user.user_id }, 'secret_key');
        res.send({ message: 'Sign-in successful', token });
      } else {
        res.status(401).send({ message: 'Invalid email or password' });
      }
    }
  );
});

app.post('/api/signup', (req, res) => {
  const { user_id, email, password } = req.body;
  connection.query(
    'INSERT INTO user (user_id, email, password) VALUES (?, ?, ?)',
    [user_id, email, password],
    (err, results) => {
      if (err) {
        console.error('Error signing up:', err);
        res.status(500).send({ message: 'Server error' });
      } else {
        res.send({ message: 'Sign-up successful' });
      }
    }
  );
});

app.get('/product/1', (req, res) => {
  const product_id = 5;
  const searchTerm = 'LEGO Creator Expert Bookshop';
  
  // Build SQL query to retrieve product and review information
  const sql = `
    SELECT 
      p.*, 
      r.review, 
      r.rating 
    FROM 
      product p 
      LEFT JOIN review r ON p.product_id = r.prod_id
    WHERE 
      p.product_id = ? AND p.name LIKE ?
  `;
  const params = [product_id, `%${searchTerm}%`];
  
  // Execute query and return results
  connection.query(sql, params, (error, results, fields) => {
    if (error) {
      res.status(500).send(error);
    } else {
      console.log(results); // Log the results to the console
      res.send(results); // Send the results back in the response 
    
    }
  });
});

//delete
// Assuming you have a 'products' table with columns 'id', 'name', and 'price'
const product_id = 10; // ID of the product you want to delete
const rows = connection.query('DELETE FROM product WHERE product_id = 10', [product_id]);

console.log(`Deleted ${rows.affectedRows} product(s)`);

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`serve at http://localhost:${port}`);
});
