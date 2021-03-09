# 2. Introductions

## 2-0. Interface

```typescript
interface Introduction {
  id: number;
  title: string;
  name: string;
  activityIntroduction: string;
  website: string; 
  twitter: string; //Twitterスクリーンネーム（＠なし）
  instagram: string;
  mainImageURL: string;
  otherImageURLs: string[];
  youtubeLinks: string[]
  status: string;
  createdAt: string; 
  updatedAt: string;
}
```
## 2-1. introductions.list
`GET /v2/introductions`
### 2-1-a. Query Parameters

| key | | default | type | description |
|---|---|---|---|---|
| `q` | Optional | N/A | `string` | 検索文字列を指定します。 |
| `offset` | Optional | `0` | `number` | 検索結果の先頭から無視する件数を指定します。 |
| `limit` | Optional | `20` | `number` | 検索結果を取得する件数を指定します。 |
| `organizationType` | Optional | `"all"` | `organizationTypes` | 検索したい団体の種別（課外活動団体・一般学生団体・その他）を指定します。
| `activityType` | Optional | `"all"` | `activityTypes` | 検索したい団体の活動種別（体0育系・芸術系・文化系・その他）を指定します。

### 2-1-b. Responce
body: `Introduction[]`

## 2-2. introductions.get
`GET /v2/introductions/{ID}`

### 2-2-a. Responce
body: `Introduction`

## 2-3. introductions.create

`POST /v2/introductions`

### 2-3-a. Requirements

* 団体のメンバーでないユーザーは使用できません。
* 団体のメンバーであるユーザーは、以下の制約を受けます。
    * `status = "draft" | "submitted"`以外の値は指定できません。
* システム管理者権限を持つユーザー(`admin`)は、上記の制約を受けません。

### 2-3-b. Query Parameters

| key |  | default | type | description |
|---|---|---|---|---|
| `from` | Optional | N/A | `number` | 既存の`Introduction`オブジェクトのIDを指定すると、その内容を複製したオブジェクトを作成し、Request Bodyに指定したフィールドで上書きを行います。`status = "draft"`でないオブジェクトのIDが指定された場合は、デフォルトでこれを`"draft"`に上書きします。 |
| `organizationID` | **Required** |  | `number` | 紹介文等を作成したい団体の団体IDです。ユーザが当該団体に所属しているか、`from`で指定された既存の`Introduction`が同一団体のものであるかについて確認します。

### 2-3-c. Request Body
multipart/form-data: `Introduction` (text/json) , mainImage (image/jpg or png) , otherImages (image/jpg or png)

`Introduction`において、以下のフィールドは指定しても無視されます。

* `id`
* `mainImageURL`
* `otherImageURLs`
* `createdAt`
* `updatedAt`

### 2-3-d. Responce
status: `201`
body: `Introduction`

## 2-4. introductions.update

`PUT /v2/introductions/{ID}`

### 2-4-a. Requirements

* 団体のメンバーでないユーザーは使用できません。
* 団体のメンバーであるユーザーは、以下の制約を受けます。
    * `status = "draft"`でないオブジェクトは操作できません。
    * `status = "draft" | "submitted"`以外の値は指定できません。
* システム管理者権限を持つユーザー(`admin`)は、上記の制約を受けません。

### 2-4-b. Request Body

multipart/form-data:　`Partial<Introduction>` (text/json) , mainImage (image/jpg or png) , otherImages (image/jpg or png)

以下のフィールドは、指定しても無視されます。

* `id` 
* `mainImageURL`
* `otherImageURLs`
* `createdAt`
* `updatedAt`

### 2-4-c. Response

body: `Introduction`

## 2-5. introductions.delete

`DELETE /v2/introductions/{ID}`

### 2-5-a. Requirements

システム管理権限を持つユーザ(`admin`)のみが実行できます。

### 2-5-b. Response

status: `204`
