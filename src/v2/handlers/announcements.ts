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

export default app
