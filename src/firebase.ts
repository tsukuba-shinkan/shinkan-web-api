/**
 * 1. import this to initialize firebase.
 * 2. `import admin from "firebase-admin"` in your code.
 * 3. use firebase feature
 */

import admin from 'firebase-admin'

const serviceAccountB64 = process.env.FIREBASE_SERVICE_ACCOUNT
if (!serviceAccountB64) {
  throw new Error('no service account')
}
const serviceAccount = JSON.parse(
  Buffer.from(serviceAccountB64, 'base64').toString('ascii')
)

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
})
