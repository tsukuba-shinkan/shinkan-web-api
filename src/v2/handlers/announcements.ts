/**
 * v2.Announcement
 */
import express from 'express'

// Announcementの型定義
// import { IAnnouncement } from '../types'

// AnnouncementのORM
// import { Announcement } from '../models/Announcement'

/** v2.announcement */
const app = express()

// v2.announcements.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})
// v2.announcements.get
app.get('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.announcements.create
app.post('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.announcements.update
app.put('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.announcements.delete
app.delete('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
