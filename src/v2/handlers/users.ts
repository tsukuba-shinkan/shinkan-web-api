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
// v2.users.get
app.get('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.users.create
app.post('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.users.update
app.put('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.users.delete
app.delete('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
