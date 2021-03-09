/**
 * v2.Introduction
 */
import express from 'express'

// Introductionの型定義
// import { IIntroduction } from '../types'

// IntroductionのORM
// import { Introduction } from '../models/Introduction'

/** v2.introduction */
const app = express()

// v2.introductions.list
app.get('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
