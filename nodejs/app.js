const express = require("express");
const cors = require('cors');
const ytdl = require('ytdl-core');
const ejs = require("ejs");
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');
const fs = require('fs');
const path = require('path');
const mime = require('mime');

const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'hanyeong1234',
  database : 'webic'
});

connection.connect();



app.set("view engine", "ejs");
app.set('views', __dirname + '/views');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(express.static(__dirname + '/'));

app.get("/", function(req, res){
	res.render("privacy", {});
});

app.get("/gg", function(req, res){
	res.render("gg", {});
});

app.get('/download', (req,res) => {
	var URL = req.query.URL;
	var title = req.query.title;
	var id = req.query.id;
	var videoname = "";
	let insertSql = "INSERT INTO musiclist (userId, title, address) VALUES (?, ?, ?)";

console.log(URL);
console.log(title);
console.log(id);
console.log(videoname);
connection.query("SELECT max(no) as num from musiclist", (error, result) => {
  if (error) throw error;
	else{
		console.log(result[0].num);
		videoname = result[0].num+1+"_"+id+"_"+"music.mp3";
		var videoPath ='C:\\webicpj\\webic\\src\\main\\resources\\static\\video'+'\\'+videoname;
		var videoInsertPath = '/video/'+videoname;
		console.log(videoPath);
		connection.query(insertSql, [id, title, videoInsertPath], (err, mResult) => {
			if(err) throw err;
			else{
				res.set('Content-Disposition', 'attachment; filename='+videoname);
				var Stream = fs.createWriteStream(videoPath);
				ytdl(URL, {format:'mp3', filter: 'audioonly' }).pipe(Stream);

				res.end();
			}
		});
	};
});

});

app.get("/privacy", function(req, res){
    res.render("privacy", {
	one : "this is one"
});
});

app.get("/tt", function(req, res){
	res.render("ajax01", {});
});

app.post("/postTest", function(req, res){

	console.log(req.body.ttt);


connection.query("SELECT * from nuri where datemsg = " + "'" + req.body.ttt + "'", (error, rows, fields) => {
  if (error) throw error;
  console.log(rows[0].totam);
console.log(rows.time);
res.json({ok:true, gg: rows});

});


	
});



app.listen(3000, function(){
	console.log("실행중...");
});