# 3. Events
## 3-0. Interface
```typescript
interface event {
  id: number;
  title: string;
  detail: string;
  start: string; // ISO DateTime
  end: string; // ISO DateTime
  status: string;
  organizationID: number
  createdAt: string;
  updatedAt: string;
}
```
## 3-1. events.list
`GET /v2/events`
### 3-1-a. Query Parameters
| key | | default | type | description |
|---|---|---|---|---|
| `q` | Optional | N/A | `string` | 検索文字列を指定します。 |
| `offset` | Optional | `0` | `number` | 検索結果の先頭から無視する件数を指定します。 |
| `limit` | Optional | `20` | `number` | 検索結果を取得する件数を指定します。 |
| `date` | Optional | `today()` | `string` | 日（開始日）を指定します。
| `organizationID` | Optional | N/A | `number` | イベントを実施する団体の団体IDを指定します。

### 3-1-b. Responce
body: `event[]` 

## 3-2. events.get
`GET /v2/events/{ID}`
### 3-2-a. Responce
body: `event`

## 3-3. events.create
`POST /v2/events`
### 3-3-a. Requirements
* 団体のメンバーでないユーザーは使用できません。
* 団体のメンバーであるユーザーは、以下の制約を受けます。
    * `status = "draft" | "submitted"`以外の値は指定できません。
* システム管理者権限を持つユーザー(`admin`)は、上記の制約を受けません。

### 3-3-b. Query Parameters
| key |  | default | type | description |
|---|---|---|---|---|
| `from` | Optional | N/A | `number` | 既存の`Event`オブジェクトのIDを指定すると、その内容を複製したオブジェクトを作成し、Request Bodyに指定したフィールドで上書きを行います。`status = "draft"`でないオブジェクトのIDが指定された場合は、デフォルトでこれを`"draft"`に上書きします。 |
| `organizationID` | **Required** |  | `number` | 紹介文等を作成したい団体の団体IDです。ユーザが当該団体に所属しているか、`from`で指定された既存の`Event`が同一団体のものであるかについて確認します。

### 3-3-c. Request body
`event`

以下のフィールドは指定しても無視されます。
* `id`
* `createdAt`
* `updatedAt`

### 3-3-d. Responce
status: `201`<br>
body: `event`

## 3-4. events.update
`PUT /v2/events/{ID}`
### 3-4-a. Requirements
* 団体のメンバーでないユーザーは使用できません。
* 団体のメンバーであるユーザーは、以下の制約を受けます。
    * `status = "draft" | "submitted"`以外の値は指定できません。
* システム管理者権限を持つユーザー(`admin`)は、上記の制約を受けません。

### 3-4-b. Request Body
`Partical<event>`
以下のフィールドは指定しても無視されます。
* `id`
* `createdAt`
* `updatedAt`

## 3-5. events.delete
`DELETE /v2/events/{ID}`

### 3-5-a. Requirements
システム管理権限を持つユーザ(`admin`)のみ実行できます。

### 3-5-b. Responce
body: `Event`