# 3. Events
## 3-0. Interface
```typescript=
interface event {
  id: number;
  title: string;
  detail: string;
  start: string; // ISO DateTime
  end: string; // ISO DateTime
  organizationID: number
}
```
## 3-1. events.list
`GET /v2/events`

## 3-2. events.get
`GET /v2/events/{ID}`

## 3-3. events.create
`POST /v2/events`

## 3-4. events.update
`PUT /v2/events/{ID}`

## 3-5. events.delete
`DELETE /v2/events/{ID}`