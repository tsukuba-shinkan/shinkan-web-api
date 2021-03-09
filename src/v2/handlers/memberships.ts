/**
 * v2.Membership
 */
import express from 'express'

// Membershipの型定義
// import { IMembership } from '../types'

// MembershipのORM
// import { Membership } from '../models/Membership'

/** v2.membership */
const app = express()

// v2.memberships.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
