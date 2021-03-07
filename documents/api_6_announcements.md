# 6. Announcements
## 6-0. Interface

```typescript
interface Announcement {
  id: number;
  title: string;
  content: string;
  isPublished: boolean;
  createdAt: string;
  updatedAt: string;
}
```

## 6-1. announcements.list

`GET /v2/announcements`

### 6-1-a. Requirements
- システム管理権限を持つユーザ(`admin`)**以外**は、`isPublished`が`TRUE`のもののみ取得できます。

### 6-1-b. Query Parameters

| key |  | default | type | description |
|---|---|---|---|---|
| `q` | Optional | N/A | `string` | 検索キーワードを指定します。
| `isPublished` | Optional | N/A | `number` | `1`を指定すると公開済みのもの、`0`を指定すると未公開のものの一覧をそれぞれ取得できます。

### 6-1-c. Response
body: `Announcement[]`

## 6-2. announcements.get

`POST /v2/announcements/{ID}`

### 6-2-a. Requirements
- システム管理権限を持つユーザ(`admin`)**以外**は、`isPublished`が`TRUE`のもののみ取得できます。

### 6-22-b. Response
body: `Announcement`

## 6-3. announcements.create

`POST /v2/announcements`

### 6-3-a. Requirements
- システム管理権限を持つユーザ(`admin`)のみが実行できます。

### 6-3-b. Request Body
`Announcement`

以下のフィールドは指定しても無視されます。
- id
- createdAt
- updatedAt

### 6-3-c. Response
status: `201`
body: `Announcement`

## 6-4. announcements.update
`PUT /v2/announcements/{ID}`

### 6-4-a. Requirements
- システム管理権限を持つユーザ(`admin`)のみが実行できます。

### 6-4-b. Request Body
`Partial<Announcement>`

以下のフィールドは指定しても無視されます。
- id
- createdAt
- updatedAt

### 6-4-c. Response
body: `Announcement`

## 6-5. announcements.delete

`DELETE /v2/announcements/{ID}`

### 6-6-a. Requirements
- システム管理権限を持つユーザ(`admin`)のみが実行できます。

### Response
status: `204`
