/**
 * v2.Organization
 */
import express from 'express'

/** v2.organization */
const app = express()

// v2.organizations.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
