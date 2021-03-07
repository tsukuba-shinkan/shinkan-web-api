# 4. Reviews

## 4-0. Interface

```typescript
interface Review {
  id: number;
  type: string; //"introduction" or "event"
  contentID: number;
  result: string;
  reason: string;
  createdAt: string;
  updatedAt: string;
}
```
## 4-1. reviews.list
`GET /v2/reviews`
### 4-1-a. Requirements
- システム管理権限(`admin`)・レビュアー権限(`reviwer`)・各団体に所属するログイン済みのユーザ(`general`)が実行できます。
- 各団体に所属するユーザには、当該ユーザが所属する団体のもののみを返します。

### 4-1-b. Query Parameters
| key |  | default | type | description |
|---|---|---|---|---|
| `organizationID` | Optional | N/A | `number` | レビュー一覧を取得したい団体のIDを指定します。
| `type` | Optional | N/A | `string` | 取得したいレビュー対象の種別を指定します。(`"introduction" \| "event"` )
| `contentID` | Optinal | N/A | `number` | レビューを取得したい対象の`contentID`を指定します。

### 4-1-c. Responce
body: `Review[]`

## 4-2. reviews.get
`GET /v2/reviews/{ID}` 

### 4-2-a. Requirements
- システム管理権限(`admin`)・レビュアー権限(`reviwer`)・各団体に所属するログイン済みのユーザ(`general`)が実行できます。
- 各団体に所属するユーザには、当該ユーザが所属する団体のもののみを返します。

### 4-2-b. Responce
body: `Review`

## 4-3. reviews.create
`POST /v2/reviews`

### 4-3-a. Requirements
レビュアー権限(`reviewer`)またはシステム管理権限(`admin`)を持つユーザーのみが使用できます。

### 4-3-b. Request Body
`Review`

### 4-3-c. Response

status: `201`  
body: `Review`

## 4-4. reviews.update

`PUT /v2/reviews/{ID}` 

### 4-4-a. Requirements

レビュアー権限(`reviewer`)またはシステム管理権限(`admin`)を持つユーザーのみが使用できます。

### 4-4-c. Request Body
`Partial<Review>`

### 4-4-d. Response
body: `Review`

## 4-5. reviews.delete
`DELETE /v2/reviews/{ID}`

### 4-5-a. Requirements
レビュアー権限(`reviewer`)またはシステム管理権限(`admin`)を持つユーザーのみが使用できます。

### 4-5-b. Responce
status: `204`
