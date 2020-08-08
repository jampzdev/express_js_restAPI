const mysql      = require('mysql');
const express    = require('express');
const bodyParser = require('body-parser');
const cors       = require('cors');

var app                 = express();
var urlencodedParser = bodyParser.urlencoded({ extended: true });

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json());

app.use(cors());

var mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'P@55w0rd',
    database: 'library_db',
    multipleStatements: true
});

mysqlConnection.connect((err) => {
    if (!err)
        console.log('DB connection succeded.');
    else
        console.log('DB connection failed \n Error : ' + JSON.stringify(err, undefined, 2));
});

app.listen(3000, () => console.log('Express server is running at port no : 3000'));

//USER LOGIN
app.post('/auth', urlencodedParser, function(req, res){
    let payload = req.body;
    var sqlQuery = 'SELECT * FROM users_tbl WHERE uname = ? AND pwd = ?'
    mysqlConnection.query(sqlQuery, [payload.uname, payload.pwd], (err, rows, fields) => {
        if (!err){
            console.log(rows)
            var info = []
            rows.forEach(element => {
                arr = {
                    id  : element.id,
                    role: element.role,
                    fname: element.fname,
                    lname: element.lname,
                    uname: element.uname
                }
                info.push(arr)
            });

            response = {
                devMessage: info,
                itemCount : info.length
            }

            res.send(response,200);
        }
        else{

        }
            console.log(err);
    })
});

app.post('/get-books', urlencodedParser, function (req, res) {
    var body = req.body
    var sqlQuery= ""
    if (req.body.search==""){
        sqlQuery = 'SELECT a.id,a.status,a.location,a.title,a.author,a.owner,a.checked_out_date,CONCAT(b.fname," ",b.lname) AS user_name FROM books_tbl a LEFT JOIN users_tbl b ON b.id = a.checked_out_by_id'
    }
    else{
        sqlQuery  = 'SELECT a.id,a.status,a.location,a.title,a.author,a.owner,a.checked_out_date,CONCAT(b.fname," ",b.lname) AS user_name FROM books_tbl a ';
        sqlQuery += 'LEFT JOIN users_tbl b ON b.id = a.checked_out_by_id ';
        sqlQuery += "WHERE UPPER(a.title) LIKE '%" + req.body.search +"%'";
        sqlQuery += " OR UPPER(a.author) LIKE '%" + req.body.search + "%'";
        sqlQuery += " OR UPPER(a.owner) LIKE '%" + req.body.search + "%'";

    }

    console.log(sqlQuery)
    mysqlConnection.query(sqlQuery, [req.body.search], (err, rows, fields) => {
        if (!err) {
            console.log(rows)
            var info = []
            rows.forEach(element => {
                arr = {
                    id: element.id,
                    status: element.status,
                    location: element.location,
                    title: element.title,
                    author: element.author,
                    owner: element.owner,
                    checked_out_by: element.checked_out_by,
                    checked_out_date: element.checked_out_date,
                    user_name: element.user_name
                }
                info.push(arr)
            });

            response = {
                devMessage: info,
                itemCount: info.length
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});

app.post('/save-book', urlencodedParser, function (req, res) {
    var req_body = req.body;
    var sqlQuery = 'INSERT INTO books_tbl(title,author,owner,location,status)VALUES(?,?,?,?,?)';
    mysqlConnection.query(sqlQuery, [req_body.title, req_body.author, req_body.owner, req_body.location, req_body.status], (err, rows, fields) => {
        if (!err) {
            response = {
                statusCode: 200,
                devMessage: "Record has been Added"
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});

app.post('/update-book', urlencodedParser, function (req, res) {
    var req_body = req.body;
    var sqlQuery = 'UPDATE books_tbl set title=?,author=?,owner=?,location=?,status=? WHERE id = ? ';
    mysqlConnection.query(sqlQuery, [req_body.title, req_body.author, req_body.owner, req_body.location, req_body.status, req_body.id], (err, rows, fields) => {
        if (!err) {
            response = {
                statusCode: 200,
                devMessage: "Record has been Updated"
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});

app.post('/new-account', urlencodedParser, function (req, res) {
    var req_body = req.body;
    var sqlQuery = 'INSERT INTO users_tbl(fname,lname,uname,pwd,role)VALUES(?,?,?,?,?)';
    mysqlConnection.query(sqlQuery, [req_body.fname, req_body.lname, req_body.uname, req_body.pwd, req_body.role], (err, rows, fields) => {
        if (!err) {
            response = {
                statusCode: 200,
                devMessage: "New account has been registered!"
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});

app.post('/save-comment', urlencodedParser, function (req, res) {
    var req_body = req.body;
    var sqlQuery = 'INSERT INTO comments_tbl(bookid,userid,comment,comment_date)VALUES(?,?,?,?)';
    mysqlConnection.query(sqlQuery, [req_body.bookid, req_body.userid, req_body.comment, req_body.comment_date], (err, rows, fields) => {
        if (!err) {
            response = {
                statusCode: 200,
                devMessage: "Comment Submitted"
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});

app.post('/get-comments', urlencodedParser, function (req, res) {
    var body = req.body
    var sqlQuery = 'SELECT a.id,a.bookid,a.userid,CONCAT(b.fname," ", b.lname) AS user_name,a.comment,a.comment_date FROM comments_tbl a LEFT JOIN users_tbl b ON b.id = a.userid WHERE bookid = ?'
    mysqlConnection.query(sqlQuery, [body.bookid], (err, rows, fields) => {
        if (!err) {
            console.log(rows)
            var info = []
            rows.forEach(element => {
                arr = {
                    id: element.id,
                    bookid: element.bookid,
                    userid: element.userid,
                    user_name: element.user_name,
                    comment: element.comment,
                    comment_date: element.comment_date
                }
                info.push(arr)
            });

            response = {
                devMessage: info,
                itemCount: info.length
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});

app.post('/borrow-book', urlencodedParser, function (req, res) {
    var req_body = req.body;
    var sqlQuery = 'UPDATE books_tbl set status=?,checked_out_by_id=?,checked_out_date=? WHERE id = ? ';
    mysqlConnection.query(sqlQuery, [req_body.status, req_body.checked_out_by_id, req_body.checked_out_date, req_body.bookid], (err, rows, fields) => {
        if (!err) {
            response = {
                statusCode: 200,
                devMessage: "Book status updated"
            }

            res.send(response, 200);
        }
        else {

        }
        console.log(err);
    })
});
