/**
 * v2.Page
 */
import express from 'express'

// Pageの型定義
// import { IPage } from '../types'

// PageのORM
// import { Page } from '../models/Page'

/** v2.page */
const app = express()

// v2.pages.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
