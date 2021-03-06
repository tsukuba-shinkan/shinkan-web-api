# 7. Users
## 7-0. Interface

```typescript=
interface User {
}
```
## 7-1. users.list
`GET /v2/users`
所属団体で絞り込めるように。一般ユーザは自団体のみ。

## 7-2. users.get
`GET /v2/users/{UID}`

## 7-3. users.createn
`POST /v2/users`

## 7-4. users.update
`PUT /v2/users/{ID}`

## 7-5. users.delete
`DELETE /v2/users/{ID}`
