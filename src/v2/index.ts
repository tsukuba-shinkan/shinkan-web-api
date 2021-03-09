import express from 'express'
import organizations from './handlers/organizations'
import introductions from './handlers/introductions'
import events from './handlers/events'
import reviews from './handlers/reviews'
import pages from './handlers/pages'
import announcements from './handlers/announcements'
import users from './handlers/users'
import memberships from './handlers/memberships'
import invitations from './handlers/invitations'
import { authMiddleware } from './middlewares/auth'

const app = express()

app.use(authMiddleware)
app.use('/organizations', organizations)
app.use('/introductions', introductions)
app.use('/events', events)
app.use('/reviews', reviews)
app.use('/pages', pages)
app.use('/announcements', announcements)
app.use('/users', users)
app.use('/memberships', memberships)
app.use('/invitations', invitations)
export default app
