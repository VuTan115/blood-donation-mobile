import admin from 'firebase-admin'

function isAuth(req, res, next) {
  if (req.headers.authtoken) {
    admin.auth().verifyIdToken(req.headers.authtoken)
      .then((token) => {
        req.body.user = token
        next()
      }).catch(() => {
        res.status(403).send('Unauthorized')
      })
  } else {
    res.status(403).send('Unauthorized')
  }
}

export default isAuth
