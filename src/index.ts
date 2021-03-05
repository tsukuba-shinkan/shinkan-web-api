import express from 'express'
import v1 from './v1'

const PORT = +(process.env.PORT || 8080)

const app = express()

// Version 1
app.use('/v1', v1)

app.listen(PORT, () => console.info(`Listening port ${PORT}`))
