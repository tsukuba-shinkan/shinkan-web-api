import express from 'express'
import organizations from './handlers/organizations'
import { authMiddleware } from './middlewares/auth'

const app = express()

app.use(authMiddleware)
app.use('/organizations', organizations)

export default app
