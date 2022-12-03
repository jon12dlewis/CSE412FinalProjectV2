const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

//middleware
app.use(cors());
app.use(express.json());

//ROUTES//

// create a resturant

app.post("/resturants", async(req, res) => {
    try {
        //console.log(req.body);
        const { description } = req.body;
        const newRestuant = await pool.query("INSERT INTO resturants (description) VALUES($1)",
            [description]
        );

        res.json(newRestuant.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

// get all resturants

app.get("/resturants", async (req, res) => {
    try {
        const allResturants = await pool.query("SELECT * FROM resturants");
        res.json(allResturants.rows);
    } catch (err) {
        console.error(err.message);
    }
})

// get a resturant

app.get("/resturants/:id", async (req, res) => {
    try {
        //console.log(req.params)
        const { id } = req.params;
        const resturant = await pool.query("SELECT * FROM resturants WHERE r_id = $1", [id]);

        res.json(resturant.rows[0])
    } catch (err) {
        console.error(err.message);
    }
})

// update a resturant

app.put("/resturants/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { description } = req.body;
        const updateResturant = await pool.query("UPDATE resturants SET description = $1 WHERE r_id = $2",
            [description, id]);

        res.json("Restruant was updated");

    } catch (err) {
        console.error(err.message);
    }
})

// delete a resturant

app.delete("/resturants/:id", async (req, res) => {
    try {
        //console.log(req.params)
        const { id } = req.params;
        const deleteResturant = await pool.query("DELETE FROM resturants WHERE r_id = $1", [id]);

        res.json("Resturant was deleted!")
    } catch (err) {
        console.error(err.message);
    }
})


app.listen(5000, () => {
    console.log("server has started on port 5000");
});
