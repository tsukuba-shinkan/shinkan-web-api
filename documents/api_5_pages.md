# 5. Pages
## 5-0. Interface

```typescript
interface Page {
  id: number;
  slug: string;
  title: string;
  content: string;
  isPublished: boolean;
  createdAt: string;
  updatedAt: string;
}
```

## 5-1. pages.list

`GET /v2/pages`

### 5-1-a. Requirements
- システム管理権限を持つユーザ(`admin`)**以外**は、`isPublished`が`TRUE`のもののみ取得できます。

### 5-1-b. Query Parameters

| key |  | default | type | description |
|---|---|---|---|---|
| `q` | Optional | N/A | `string` | 検索キーワードを指定します。
| `isPublished` | Optional | N/A | `number` | `1`を指定すると公開済みのもの、`0`を指定すると未公開のものの一覧をそれぞれ取得できます。

### 5-1-c. Response
body: `Page[]`

## 5-2. pages.get

`POST /v2/pages/{ID}`

### 5-2-a. Requirements
- システム管理権限を持つユーザ(`admin`)**以外**は、`isPublished`が`TRUE`のもののみ取得できます。

### 5-22-b. Response
body: `Page`

## 5-3. pages.create

`POST /v2/pages`

### 5-3-a. Requirements
- システム管理権限を持つユーザ(`admin`)のみが実行できます。

### 5-3-b. Request Body
`Page`

以下のフィールドは指定しても無視されます。
- id
- createdAt
- updatedAt

### 5-3-c. Response
status: `201`
body: `Page`

## 5-4. pages.update
`PUT /v2/pages/{ID}`

### 5-4-a. Requirements
- システム管理権限を持つユーザ(`admin`)のみが実行できます。

### 5-4-b. Request Body
`Partial<Page>`

以下のフィールドは指定しても無視されます。
- id
- createdAt
- updatedAt

### 5-4-c. Response
body: `Page`

## 5-5. pages.delete

`DELETE /v2/pages/{ID}`

### 5-5-a. Requirements
- システム管理権限を持つユーザ(`admin`)のみが実行できます。

### Response
status: `204`
