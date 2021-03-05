import express from 'express'
import v2 from './v2'

const PORT = +(process.env.PORT || 8080)

const app = express()

// Version 2
app.use('/v2', v2)

app.listen(PORT, () => console.info(`Listening port ${PORT}`))
