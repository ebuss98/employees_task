import express from 'express'
let router = express.Router();

router.get('/', function(req, res, next) {
  res.send('hello from root')
});

export default router
