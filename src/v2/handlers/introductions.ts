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

// v2.introductions.get
app.get('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.introductions.create
app.post('/', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.introductions.update
app.put('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

// v2.introductions.delete
app.delete('/:id', (_, res) => {
  res.status(501).json({ message: 'to be implemented' })
})

export default app
