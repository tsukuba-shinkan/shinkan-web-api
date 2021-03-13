import { RequestHandler } from 'express'
import admin from 'firebase-admin'
export const authMiddleware: RequestHandler = (req, res, next) => {
  ;(async () => {
    const token = req.headers.authorization
    if (!token) {
      throw new Error()
    }

    await admin.auth().verifyIdToken(token)
  })()
    .then(next)
    .catch(e => {
      console.log(e)

      res.status(403).send('Invalid token')
    })
}
