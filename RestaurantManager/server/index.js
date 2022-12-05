const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
const port = 5000;

//middleware
app.use(cors());
app.use(express.json());

//ROUTES


//Add Seats
app.post("/dine_table", async (req, res) => {
  try {
    const body = req.body;
    const newCustomer = await pool.query(
      `INSERT INTO dine_table VALUES($1,$2,$3,$4)`,
      [body.t_id, body.r_id, body.max_seats, body.reserved]
    );

    res.json(newCustomer.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//Create Restaurant
app.post("/restuarants", async (req, res) => {
  try {
    const body = req.body;
    const newRestaurant = await pool.query(
      `INSERT INTO restaurant VALUES($1,$2,$3,$4,$5,$6,$7)`,
      [
        body.r_id,
        body.r_name,
        body.r_address,
        body.r_description,
        body.r_phone,
        body.r_rating,
        body.r_image,
      ]
    );
    res.json(newRestaurant.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//create Review
app.post("/review", async (req, res) => {
  try {
    const body = req.body;
    const newRestaurant = await pool.query(
      `INSERT INTO reviews VALUES($1,$2,$3,$4,$5,$6)`,
      [
        body.rev_id,
        body.r_id,
        body.rev_text,
        body.rev_date,
        body.rev_rating,
        body.name
      ]
    );
    res.json(newRestaurant.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//Create Customer
app.post("/customer", async (req, res) => {
  try {
    const body = req.body;
    const newCustomer = await pool.query(
      `INSERT INTO customer VALUES($1,$2,$3,$4,$5,$6,$7,$8)`,
      [
        body.c_id,
        body.rev_id,
        body.res_id,
        body.c_name,
        body.c_age,
        body.c_address,
        body.c_email,
        body.c_phone,
      ]
    );

    res.json(newCustomer.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//Create Reservation
app.post("/reservation", async (req, res) => {
  try {
    const body = req.body;
    const newCustomer = await pool.query(
      `INSERT INTO reservation VALUES($1,$2,$3,$4)`,
      [body.res_id, body.t_id, body.res_date, body.res_size]
    );

    res.json(newCustomer.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//delete Restaurant
app.delete("/restuarants/:id", async (req, res) => {
  try {
    const id = req.params.id;
    console.log(`Delete FROM restaurant where r_name = ${id}`);
    const allResturants = await pool.query(
      `Delete FROM restaurant where r_id = ${id}`
    );
    res.json(allResturants.rows);
  } catch (err) {
    console.error(err.message);
  }
});

// get all restaurants
app.get("/restuarants", async (req, res) => {
  try {
    const allResturants = await pool.query("SELECT * FROM restaurant");
    res.json(allResturants.rows);
  } catch (err) {
    console.error(err.message);
  }
});

// get certain restaurant
app.get("/restuarants/:id", async (req, res) => {
  try {
    const restaurant = await pool.query(
      `SELECT r_name,r_description,r_address, r_phone, r_image FROM restaurant where r_id = ${req.params.id}`
    );
    res.json(restaurant.rows);
  } catch (err) {
    console.error(err.message);
  }
});

// get certain reviews
app.get("/reviews/:id", async (req, res) => {
  try {
    const restaurant = await pool.query(
      `SELECT * FROM  reviews where reviews.r_id = ${req.params.id}`
    );
    res.json(restaurant.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//get restaurants reservation
app.get("/reservation/restaurant/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const allReservation = await pool.query(
      `SELECT * FROM customer,restaurant,dine_table,reservation where restaurant.r_id = dine_table.r_id and reservation.t_id = dine_table.t_id and reservation.res_id = customer.res_id and restaurant.r_id = ${id}`
    );
    console.log(allReservation.rows);
    res.json(allReservation.rows);
  } catch (err) {
    console.error(err.message);
  }
});


//get Customers reservation
app.get("/reservation/:id", async (req, res) => {
  try {
    const id = req.params.id;

    const allReservation = await pool.query(
      `SELECT * FROM customer,restaurant,dine_table,reservation where restaurant.r_id = dine_table.r_id and reservation.t_id = dine_table.t_id and reservation.res_id = customer.res_id and customer.res_id = ${id}`
    );
    console.log(allReservation.rows);
    res.json(allReservation.rows);
  } catch (err) {
    console.error(err.message);
  }
});


app.get("/restuarants", async (req, res) => {
  try {
    const allResturants = await pool.query("SELECT * FROM restaurant");
    res.json(allResturants.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//get seats of restaurant
app.get("/dineTable/:id", async (req, res) => {
  try {
    const id = req.params.id;

    const allReservation = await pool.query(
      // `SELECT * FROM dine_table,restaurant where restaurant.r_id = dine_table.r_id and restaurant.r_id = ${id}`
      `SELECT * FROM dine_table where dine_table.r_id = ${id}`

      );
    res.json(allReservation.rows);
  } catch (err) {
    console.error(err.message);
  }
});



app.listen(port, () => {
  console.log(`server has started on port ${port}`);
});


//update a Restaurant
app.put("/restuarants/update", async (req, res) => {
  try {
    const body = req.body;
    const newRestaurant = await pool.query(
      `UPDATE restaurant Set r_name= $1, r_address = $2, r_description = $3, r_phone = $4, r_image = $5 where  r_id = $6`,
      [body.r_name,
      body.r_address,
      body.r_description,
      body.r_phone,
      body.r_image,
      body.r_id
      ]);
    res.json("Restaurant was updated");
  } catch (err) {
    console.error(err.message);
  }
});


