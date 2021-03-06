# 1. Organizations

## 1-0. Interface
```typescript
interface Organization {
  id: number;
  name: string;
  title: string;
  mainImageURL: string;
  organizationType: string;
  activityType: string;
  createdAt: string;
  updatedAt: string;
}
```

## 1-1. organizations.list

`GET /v2/organizations`

### 1-1-a. Query Parameters

| key | | default | type | description |
|---|---|---|---|---|
| `q` | Optional | N/A | `string` | 検索文字列を指定します。 |
| `offset` | Optional | `0` | `number` | 検索結果の先頭から無視する件数を指定します。 |
| `limit` | Optional | `20` | `number` | 検索結果を取得する件数を指定します。 |
| `organizationType` | Optional | `"all"` | `organizationTypes` | 検索したい団体の種別（課外活動団体・一般学生団体・その他）を指定します。
| `activityType` | Optional | `"all"` | `activityTypes` | 検索したい団体の活動種別（体0育系・芸術系・文化系・その他）を指定します。


### 1-1-b. Response

body: `Organization[]` (団体情報リスト)

## 1-2. organizations.get

`GET /v2/organizations/{ID}`


### 1-2-a. Response

body: `Organization` (個別団体情報)

## 1-3. organizations.create

`POST /v2/organizations`

### 1-3-a. Requirements

システム管理権限を持つユーザーのみが実行できます。

### 1-3-b. Request body

`Organization`

以下のフィールドは指定しても無視されます。

* `id`
* `created_at`
* `updated_at`

// `created_at`、`updated_at`の表記法どうする？（`createdAt`など）

### 1-3-c. Response

status: `204`
body: `Organization`

## 1-4. organizations.update

`PUT /v2/organizations/{ID}`

### 1-4-a. Requirements

システム管理権限を持つユーザー(`admin`)、または団体のメンバーであるユーザーのみが実行できます。

### 1-4-b. Request body

`Partial<Organization>`

以下のフィールドは指定しても無視されます。

* `id`
* `created_at`
* `updated_at`

以下のフィールドは、システム管理権限を持つユーザーのみが使用できます。

* `name`
* `organizationType`
* `activityType`

### 1-4-c. Response

body: `Organization` (個別団体情報)

## 1-5. organizations.delete

`DELETE /v2/organizations/{ID}`

### 1-5-a. Requirements

システム管理権限を持つユーザのみが実行できます。

### 1-5-b. Response

status: `204`
