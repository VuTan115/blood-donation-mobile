function def(req, res, next) {
  req.body.user = {}
  req.body.user.uid = 's1PCfr3OdDU3qsnemaL1CngTAdw1'
  next()
}

export default def
