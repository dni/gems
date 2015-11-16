express = require("express");
express()
  .engine('html', require('ejs').renderFile)
  .use('/', express.static(process.cwd()))
  .get("/", function(req,res){
    res.render("index.html")
  })
  .listen(2020)
