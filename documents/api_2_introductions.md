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
  (status: string;)
  (createdAt: datetime;)
  (updatedAt: datetime;)
}
```
## 2-1. introductions.list
`GET /v2/introductions`

## 2-2. introductions.get
`GET /v2/introductions/{ID}`

* 前者listで後者getにして両方作るんじゃないの？（いなだ）

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
// 画像ってどうやって投げたらいいんだbase64?
// たしかに〜〜Multipart Requestか、別エンドポイントにするしかないかも（いなだ）

| key |  | default | type | description |
|---|---|---|---|---|
| `from` | Optional | N/A | `number` | 既存の`Introduction`オブジェクトのIDを指定すると、その内容を複製したオブジェクトを作成し、Request Bodyに指定したフィールドで上書きを行います。`status = "draft"`でないオブジェクトのIDが指定された場合は、デフォルトでこれを`"draft"`に上書きします。 |

### 2-3-c. Request Body

`Introduction`

以下のフィールドは、指定しても無視されます。

* `id`
* `created_at`
* `updated_at`
// 表記

## 2-4. introductions.update

`PUT /v2/introductions/{ID}`

### 2-4-a. Requirements

* 団体のメンバーでないユーザーは使用できません。
* 団体のメンバーであるユーザーは、以下の制約を受けます。
    * `status = "draft"`でないオブジェクトは操作できません。
    * `status = "draft" | "submitted"`以外の値は指定できません。
* システム管理者権限を持つユーザー(`admin`)は、上記の制約を受けません。

### 2-4-b. Request Body

`Partial<Introduction>`

以下のフィールドは、指定しても無視されます。

* `id` 
* `created_at`
* `updated_at`

### 2-4-c. Response

body: `Introduction`

## 2-5. introductions.delete

`DELETE /v2/introductions/{ID}`

### 2-5-a. Requirements

システム管理権限を持つユーザのみが実行できます。

### 2-5-b. Response

status: `204`
