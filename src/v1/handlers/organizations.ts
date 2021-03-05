/**
 * v1.Organization
 */
import express from 'express'

/** v1.organization */
const app = express()

// v1.organizations.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
