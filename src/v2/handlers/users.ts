/**
 * v2.User
 */
import express from 'express'

// Userの型定義
// import { IUser } from '../types'

// UserのORM
// import { User } from '../models/User'

/** v2.user */
const app = express()

// v2.users.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
