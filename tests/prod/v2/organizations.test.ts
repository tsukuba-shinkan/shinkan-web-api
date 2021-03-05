import request from 'supertest'
import v2 from '../../../src/v2'

describe('v2.organizations.list', () => {
  test('It should be return 501', async () => {
    const res = await request(v2).get('/organizations')
    expect(res.status).toBe(501)
  })
})
