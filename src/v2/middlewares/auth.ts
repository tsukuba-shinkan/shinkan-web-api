import { RequestHandler } from 'express'

export const authMiddleware: RequestHandler = (req, _res, next) => {
  // To be implemented
  req.auth = null

  next()
}
