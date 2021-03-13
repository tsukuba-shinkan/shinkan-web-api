/**
 * v2.Organization
 */
import express from 'express'

// Organizationの型定義
// import { IOrganization } from '../types'

// OrganizationのORM
// import { Organization } from '../models/Organization'

/** v2.organization */
const app = express()

// v2.organizations.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.organizations.get
app.get('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.organizations.create
app.post('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.organizations.update
app.put('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.organizations.delete
app.delete('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
