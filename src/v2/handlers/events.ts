/**
 * v2.Event
 */
import express from 'express'

// Eventの型定義
// import { IEvent } from '../types'

// EventのORM
// import { Event } from '../models/Event'

/** v2.event */
const app = express()

// v2.events.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})
// v2.events.get
app.get('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.events.create
app.post('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.events.update
app.put('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.events.delete
app.delete('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})
export default app
