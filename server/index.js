const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

//middleware
app.use(cors());
app.use(express.json());

//ROUTES//

// create a resturant

app.post("/restaurants", async(req, res) => {
    try {
        //console.log(req.body);
        const { description } = req.body;
        const newRestuant = await pool.query("INSERT INTO restaurants (description) VALUES($1)",
            [description]
        );

        res.json(newRestuant.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

// create a review

app.post("/reviews", async(req, res) => {
    try {
        //console.log(req.body);
        const { text } = req.body;
        const newReview = await pool.query("INSERT INTO resturants (rev_text) VALUES($1)",
            [text]
        );

        res.json(newReview.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

// get all resturants

app.get("/restaurants", async (req, res) => {
    try {
        const allResturants = await pool.query("SELECT * FROM restaurants");
        res.json(allResturants.rows);
    } catch (err) {
        console.error(err.message);
    }
})

// get a resturant

app.get("/restaurants/:id", async (req, res) => {
    try {
        //console.log(req.params)
        const { id } = req.params;
        const resturant = await pool.query("SELECT * FROM restaurants WHERE r_id = $1", [id]);

        res.json(resturant.rows[0])
    } catch (err) {
        console.error(err.message);
    }
})

// get all reviews for restaurant

app.get("/reviews/:id", async (req, res) => {
    try {
        //console.log(req.params)
        const { id } = req.params;
        const reviews = await pool.query("SELECT * FROM reviews WHERE r_id = $1", [id]);

        res.json(reviews.rows[0])
    } catch (err) {
        console.error(err.message);
    }
})

// update a resturant

app.put("/restaurants/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { description } = req.body;
        const updateResturant = await pool.query("UPDATE restaurants SET description = $1 WHERE r_id = $2",
            [description, id]);

        res.json("Restruant was updated");

    } catch (err) {
        console.error(err.message);
    }
})

// delete a resturant

app.delete("/restaurants/:id", async (req, res) => {
    try {
        //console.log(req.params)
        const { id } = req.params;
        const deleteResturant = await pool.query("DELETE FROM restaurants WHERE r_id = $1", [id]);

        res.json("Resturant was deleted!")
    } catch (err) {
        console.error(err.message);
    }
})

// delete a review

app.delete("/reviews/:id", async (req, res) => {
    try {
        //console.log(req.params)
        const { id } = req.params;
        const deleteReview = await pool.query("DELETE FROM reviews WHERE rev_id = $1", [id]);

        res.json("Review was deleted!")
    } catch (err) {
        console.error(err.message);
    }
})


app.listen(5000, () => {
    console.log("server has started on port 5000");
});
