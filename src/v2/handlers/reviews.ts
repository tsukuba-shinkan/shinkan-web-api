/**
 * v2.Review
 */
import express from 'express'

// Reviewの型定義
// import { IReview } from '../types'

// ReviewのORM
// import { Review } from '../models/Review'

/** v2.review */
const app = express()

// v2.reviews.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
