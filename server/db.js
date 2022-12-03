// JavaScript source code
const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password: "SunDevil2018",
    host: "localhost",
    port: 5432,
    database: "notYelp"
});

module.exports = pool;