/**
 * v2.Invitation
 */
import express from 'express'

// Invitationの型定義
// import { IInvitation } from '../types'

// InvitationのORM
// import { Invitation } from '../models/Invitation'

/** v2.invitation */
const app = express()

// v2.invitations.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})
// v2.invitations.get
app.get('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.invitations.create
app.post('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.invitations.update
// app.put('/:id', (_, res) => {
//   res.status(501).json({ message: 'to be implemented' })
// })

// v2.invitations.delete
app.delete('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
